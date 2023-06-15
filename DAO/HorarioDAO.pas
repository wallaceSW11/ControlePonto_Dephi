unit HorarioDAO;

interface

uses
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, System.Classes, System.SysUtils,
  Data.DB, VCL.Forms, HorarioUtils;

type
  EFalhaConsulta = class(Exception)
  public
    constructor Create(const pMensagem: string);
  end;

  EFalhaExecSQL = class(Exception)
  public
    constructor Create();
  end;

  THorarioDAO = class
  private
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    procedure CriarTabelas;
    procedure Executar(const pComandoSQL: string);
    procedure CriarDiaParaMarcacaoCasoNaoExista();
    function Consultar(const pComandoSQL: string): string;
    function ConsultarTodos(const pComandoSQL: string): TDataSet;
  public

    procedure Insert(const pComandoSQL: string);
    procedure Update(const pComandoSQL: string);
    procedure Delete(const pComandoSQL: string);
    function Select(const pComandoSQL: string): string;
    function SelectAll(const pComandoSQL: string): TDataSet;

    constructor Create();
    destructor Destroy(); override;
  end;

implementation

{ THorarioDAO }

constructor THorarioDAO.Create;
const
  SQLITE = 'SQLite';
  NOME_BASE_DE_DADOS = 'ControlePonto.sqlite3';
  PASTA_BANCO_DE_DADOS = '\DB\';
var
  lDiretorioBaseDeDados,
  lDiretorioCompletoBaseDeDados: string;
begin
  lDiretorioBaseDeDados := ExtractFileDir(Application.ExeName) + PASTA_BANCO_DE_DADOS;
  lDiretorioCompletoBaseDeDados := ExtractFileDir(Application.ExeName) + PASTA_BANCO_DE_DADOS + NOME_BASE_DE_DADOS;

  if (not DirectoryExists(lDiretorioBaseDeDados)) then
    ForceDirectories(lDiretorioBaseDeDados);

  FConnection := TFDConnection.Create(nil);

  FConnection.Params.DriverID := SQLITE;
  FConnection.Params.Database := lDiretorioCompletoBaseDeDados;

  FConnection.Connected := (not FileExists(lDiretorioCompletoBaseDeDados));

  if (FConnection.Connected) then
    CriarTabelas();

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;

  CriarDiaParaMarcacaoCasoNaoExista();
end;

procedure THorarioDAO.CriarDiaParaMarcacaoCasoNaoExista();
const
  SELECT_HORARIO = 'Select Inicio From Horario Where Data=''%s''';
  INSERT_HORARIO = 'Insert Into Horario (Data) Values (''%s'')';
begin
  if (Consultar(Format(SELECT_HORARIO, [DataAtual()])).Trim().IsEmpty()) then
    Insert(Format(INSERT_HORARIO, [DataAtual()]));
end;

procedure THorarioDAO.CriarTabelas();
const
  CRIAR_TABELA_HORARIO =
                   'CREATE TABLE Horario ('
    + sLineBreak + '    id             INTEGER    PRIMARY KEY AUTOINCREMENT,'
    + sLineBreak + '    Data           DATE,'
    + sLineBreak + '    Inicio         STRING (5),'
    + sLineBreak + '    Almoco         STRING (5),'
    + sLineBreak + '    Retorno        STRING (5),'
    + sLineBreak + '    Fim            STRING (5),'
    + sLineBreak + '    PeriodoManha   STRING (5),'
    + sLineBreak + '    PeriodoAlmoco  STRING (5),'
    + sLineBreak + '    PeriodoTarde   STRING (5),'
    + sLineBreak + '    CargaHoraria   STRING (5),'
    + sLineBreak + '    HoraExtra      STRING (5),'
    + sLineBreak + '    Atraso         STRING (5),'
    + sLineBreak + '    TotalIntervalo STRING (5) '
    + sLineBreak + ');';

  CRIAR_TABELA_INTERVALO =
                   'CREATE TABLE Intervalo ('
    + sLineBreak + '    id             INTEGER    PRIMARY KEY AUTOINCREMENT,'
    + sLineBreak + '    Data           DATE,'
    + sLineBreak + '    Inicio         STRING (5),'
    + sLineBreak + '    Fim            STRING (5),'
    + sLineBreak + '    TotalIntervalo STRING (5) '
    + sLineBreak + ');';
begin
  FConnection.ExecSQL(CRIAR_TABELA_HORARIO);
  FConnection.ExecSQL(CRIAR_TABELA_INTERVALO);
end;

procedure THorarioDAO.Delete(const pComandoSQL: string);
begin
  Executar(pComandoSQL);
end;

destructor THorarioDAO.Destroy;
begin
  FreeAndNil(FConnection);
  FreeAndNil(FQuery);
  inherited;
end;

procedure THorarioDAO.Insert(const pComandoSQL: string);
begin
  Executar(pComandoSQL);
end;

function THorarioDAO.Select(const pComandoSQL: string): string;
begin
  Result := Consultar(pComandoSQL);

  if (Result.Trim().IsEmpty()) then
    Result := HORARIO_EM_BRANCO;
end;

function THorarioDAO.SelectAll(const pComandoSQL: string): TDataSet;
begin
  Result := ConsultarTodos(pComandoSQL);
end;

function THorarioDAO.Consultar(const pComandoSQL: string): string;
begin
  Result := EmptyStr;

  FQuery.Close();
  FQuery.SQL.Clear();
  FQuery.SQL.Add(pComandoSQL);

  try
    try
      FQuery.Open();
      Result := FQuery.Fields[0].AsString;
    except
      raise EFalhaConsulta.Create('');
    end;
  finally
    FQuery.Connection.Connected := False;
  end;
end;

function THorarioDAO.ConsultarTodos(const pComandoSQL: string): TDataSet;
begin
  Result := nil;

  FQuery.Close();
  FQuery.SQL.Clear();
  FQuery.SQL.Add(pComandoSQL);

  try
    try
      FQuery.Open();
      Result := FQuery;
    except
      on E:Exception do
      raise EFalhaConsulta.Create(E.Message);
    end;
  finally
    FQuery.Connection.Connected := False;
  end;
end;

procedure THorarioDAO.Update(const pComandoSQL: string);
begin
  Executar(pComandoSQL);
end;

procedure THorarioDAO.Executar(const pComandoSQL: string);
begin
  FQuery.Close();
  FQuery.SQL.Clear();
  FQuery.SQL.Add(pComandoSQL);

  try
    try
      FQuery.ExecSQL();
    except
      raise EFalhaConsulta.Create('');
    end;
  finally
    FQuery.Connection.Connected := False;
  end;
end;

{ EFalhaConsulta }

constructor EFalhaConsulta.Create(const pMensagem: string);
begin
  raise Exception.Create('Falha ao realizar a consulta.' + sLineBreak +'Mensagem original: ' + pMensagem);
end;

{ EFalhaExecSQL }

constructor EFalhaExecSQL.Create;
begin
  raise Exception.Create('Falha ao executar o comando.' + sLineBreak + 'Mensagem original: ' + Self.Message);
end;

end.
