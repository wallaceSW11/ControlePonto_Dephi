unit Horario;

interface

uses
  StrUtils, sysUtils, System.Generics.Collections, HorarioUtils, TelaMensagem, HorarioDAO,
  Data.DB;

type
  THorario = class;
  TIntervalo = class;

  TTipoHorario = (
    thNenhum,
    thInicio,
    thAlmoco,
    thRetorno,
    thFim,
    thInicioIntervalo,
    thFimIntervalo,
    thPeriodoManha,
    thPeriodoAlmoco,
    thPeriodoTarde,
    thCargaHoraria,
    thHoraExtra,
    thAtraso,
    thTotalIntervalo);

  TTipoHorario_Helper = record Helper for TTipoHorario
    function ToString(): string;
    function Anterior(): TTipoHorario;
    procedure SetHorario(const pHorario: THorario; const pHora: string = HORARIO_EM_BRANCO);
    function GetHorario(const pHorario: THorario): string;
  private
    function ToSQL: string;
  end;

  TIntervalo = class
  private
    FFimIntervalo: string;
    FInicioIntervalo: string;
    procedure SetFimIntervalo(const Value: string);
    procedure SetInicioIntervalo(const Value: string);
    function GetFimIntervalo: string;
    function GetInicioIntervalo: string;
  public
    property InicioIntervalo: string read GetInicioIntervalo write SetInicioIntervalo;
    property FimIntervalo: string read GetFimIntervalo write SetFimIntervalo;

   constructor Create(const pHoraInicioIntervalo: string);
    function TotalIntervalo(): string;

  end;

  THorario = class
  private
    FRetorno: string;
    FAlmoco: string;
    FFim: string;
    FInicio: string;
    FAtraso: string;
    FHoraExtra: string;
    FIntervalo: TObjectList<TIntervalo>;
    FJornadaTrabalho: string;
    FToleranciaHoraExtraAtraso: string;
    FLimiteInicioJornadaTrabalho: string;
    FLimiteFimJornadaTrabalho: string;
    FHorarioDAO: THorarioDAO;
    procedure SetAlmoco(const Value: string);
    procedure SetFim(const Value: string);
    procedure SetInicio(const Value: string);
    procedure SetRetorno(const Value: string);
    function GetAlmoco: string;
    function GetFim: string;
    function GetInicio: string;
    function GetRetorno: string;
    procedure CalcularHoraExtraAtraso(out pHoraExtra: string; out pAtraso: string);
    procedure AbortarMarcacaoCasoInicioInvalido(const pHora: string);
    procedure AbortarMarcacaoAlmocoCasoInvalido(const pHora: string);
    procedure AbortarMarcacaoRetornoCasoInvalido(const pHora: string);
    procedure AbortarMarcacaoFimCasoInvalido(const pHora: string);
    function SelectHorario(const pTipoHorario: TTipoHorario): string;
    procedure UpdateHorario(const pTipoHorario: TTipoHorario; const pHora: string);
    procedure UpdateIntervalo();
    function GetIntervalo: TObjectList<TIntervalo>;
    procedure CarregarIntervalo;
  public
    property Inicio: string read GetInicio write SetInicio;
    property Almoco: string read GetAlmoco write SetAlmoco;
    property Retorno: string read GetRetorno write SetRetorno;
    property Fim: string read GetFim write SetFim;

//    property Intervalo: TObjectList<TIntervalo> read FIntervalo write FIntervalo;
    property Intervalo: TObjectList<TIntervalo> read FIntervalo write FIntervalo;

    constructor Create(
      const pJornadaTrabalho: string;
      const pToleranciaHoraExtraAtraso: string;
      const pLimiteInicioJornadaTrabalho: string;
      const pLimiteFimJornadaTrabalho: string);
    destructor Destroy(); override;

    function PeriodoManha(): string;
    function PeriodoAlmoco(): string;
    function PeriodoTarde(): string;
    function CargaHoraria(): string;
    function HoraExtra(): string;
    function Atraso(): string;
    function PrevisaoTerminoExpediente(): string;
    function ProximaMarcacao(): TTipoHorario;
    function TotalIntervalos(): string;
    function RetornoSimulado(): string;

    procedure LimparTodos();
    procedure LimparAlmocoEmDiante();
    procedure LimparRetornoEmDiante();

    procedure ValidarHorario(const pTipoHorario: TTipoHorario; const pHora: string = '--:--');

    procedure SetInicioIntervalo(const pHora: string = HORARIO_EM_BRANCO; const pIndiceIntervalo: Integer = -1);
    procedure SetFimIntervalo(const pHora: string; const pIndiceIntervalo: Integer = -1);
    procedure RemoverIntervalo(const pIndice: Integer);

    function Horarios(const pPeriodo: string): TDataSet;
  end;

implementation

{ THorario }

function THorario.Atraso: string;
begin
  CalcularHoraExtraAtraso(FHoraExtra, FAtraso);
  Result := FAtraso;
end;

procedure THorario.CalcularHoraExtraAtraso(out pHoraExtra: string; out pAtraso: string);
var
  lDiferenca: string;
begin
  pHoraExtra := HORARIO_EM_BRANCO;
  pAtraso := HORARIO_EM_BRANCO;

  if (HorarioInvalido(CargaHoraria()) or
      HorarioInvalido(FToleranciaHoraExtraAtraso) or
      HorarioInvalido(FJornadaTrabalho)) then
    Exit();

  if (HoraToTime(CargaHoraria) > HoraToTime(FJornadaTrabalho)) then
    begin
      lDiferenca := TimeToStr(StrToTime(CargaHoraria) - StrToTime(FJornadaTrabalho));

      if (StrToTime(lDiferenca) >= StrToTime(FToleranciaHoraExtraAtraso)) then
      begin
        pHoraExtra := Copy(lDiferenca, 1, 5);
        Exit;
      end;
    end
  else
    if (HoraToTime(CargaHoraria) < HoraToTime(FJornadaTrabalho)) then
    begin
      lDiferenca := TimeToStr(StrToTime(FJornadaTrabalho) - StrToTime(CargaHoraria));

      if (StrToTime(lDiferenca) >= StrToTime(FToleranciaHoraExtraAtraso)) then
        pAtraso := Copy(lDiferenca, 1, 5);
    end;
end;

function THorario.CargaHoraria: string;
begin
  if (HorarioValido(FInicio) and
      HorarioInvalido(FAlmoco) and
      HorarioInvalido(FRetorno) and
      HorarioValido(FFim)) then
    Exit(TimeToHora(HoraToTime(FFim) - HoraToTime(FInicio)));

  if (HorarioInvalido(FInicio) or
      HorarioInvalido(FAlmoco) or
      HorarioInvalido(FRetorno) or
      HorarioInvalido(FFim)) then
    Exit(HORARIO_EM_BRANCO);

  if (FIntervalo.Count > 0) then
    Result := TimeToHora((HoraToTime(PeriodoManha) + HoraToTime(PeriodoTarde)) - HoraToTime(TotalIntervalos))
  else
    Result := TimeToHora(HoraToTime(PeriodoManha) + HoraToTime(PeriodoTarde));
end;

constructor THorario.Create(
  const pJornadaTrabalho: string;
  const pToleranciaHoraExtraAtraso: string;
  const pLimiteInicioJornadaTrabalho: string;
  const pLimiteFimJornadaTrabalho: string);

begin
  FHorarioDAO := THorarioDAO.Create();

  FIntervalo := TObjectList<TIntervalo>.Create();

  CarregarIntervalo();

  FJornadaTrabalho := pJornadaTrabalho;
  FToleranciaHoraExtraAtraso := pToleranciaHoraExtraAtraso + ':00';
  FLimiteInicioJornadaTrabalho := pLimiteInicioJornadaTrabalho;
  FLimiteFimJornadaTrabalho := pLimiteFimJornadaTrabalho;
end;

destructor THorario.Destroy;
begin
  FreeAndNil(FIntervalo);
  FreeAndNil(FHorarioDAO);
  inherited;
end;

procedure THorario.CarregarIntervalo();
const
  SELECT_INTERVALO =
    'Select * From Intervalo Where Data=''%s''';
var
  lIntervalos: TDataSet;
  lIntervalo: TIntervalo;
begin
  lIntervalos := TDataSet.Create(nil);
  lIntervalos := FHorarioDAO.SelectAll(Format(SELECT_INTERVALO, [DataAtual()]));
  lIntervalos.Active := True;
  lIntervalos.First();

  while (not lIntervalos.Eof) do
  begin
    lIntervalo := TIntervalo.Create(lIntervalos.FieldByName('Inicio').AsString);
    lIntervalo.FimIntervalo := lIntervalos.FieldByName('Fim').AsString;
    FIntervalo.Add(lIntervalo);
    lIntervalos.Next();
  end;
end;

function THorario.GetAlmoco: string;
begin
  FAlmoco := SelectHorario(thAlmoco);
  Result := FAlmoco;
end;

function THorario.GetFim: string;
begin
  FFim := SelectHorario(thFim);
  Result := FFim;
end;

function THorario.GetInicio: string;
begin
  FInicio := SelectHorario(thInicio);
  Result := FInicio;
end;

function THorario.GetIntervalo: TObjectList<TIntervalo>;
var
  lIntervalo: TIntervalo;
  lIntervalos: TDataSet;
begin
  //FIntervalo.Clear();
//
//  lIntervalos := TDataSet.Create(nil);
//
//  lIntervalos := FHorarioDAO.SelectAll('Select * from intervalo where data=''23-04-2021''');
//
//  lIntervalos.Active := True;
//
//  lIntervalos.First();
//
//  while not lIntervalos.Eof do
//  begin
//    lIntervalo := TIntervalo.Create(lIntervalos.FieldByName('Inicio').AsString);
//    lIntervalo.FimIntervalo := lIntervalos.FieldByName('Fim').AsString;
//    FIntervalo.Add(lIntervalo);
//    lIntervalos.Next();
//  end;

  Result := FIntervalo;
end;

function THorario.GetRetorno: string;
begin
  FRetorno := SelectHorario(thRetorno);
  Result := FRetorno;
end;

function THorario.HoraExtra: string;
begin
  CalcularHoraExtraAtraso(FHoraExtra, FAtraso);
  Result := FHoraExtra;
end;


function THorario.Horarios(const pPeriodo: string): TDataSet;
const
  SELECT_HORARIOS =
                   'SELECT'
    + sLineBreak + '  id,'
    + sLineBreak + '  IfNull(Data, ''--:--'') Data,'
    + sLineBreak + '  IfNull(Inicio, ''--:--'') Inicio,'
    + sLineBreak + '  IfNull(Almoco, ''--:--'') Almoco,'
    + sLineBreak + '  IfNull(Retorno, ''--:--'') Retorno,'
    + sLineBreak + '  IfNull(Fim, ''--:--'') Fim,'
    + sLineBreak + '  IfNull(PeriodoManha, ''--:--'') PeriodoManha,'
    + sLineBreak + '  IfNull(PeriodoAlmoco, ''--:--'') PeriodoAlmoco,'
    + sLineBreak + '  IfNull(PeriodoTarde, ''--:--'') PeriodoTarde,'
    + sLineBreak + '  IfNull(CargaHoraria, ''--:--'') CargaHoraria,'
    + sLineBreak + '  IfNull(HoraExtra, ''--:--'') HoraExtra,'
    + sLineBreak + '  IfNull(Atraso, ''--:--'') Atraso,'
    + sLineBreak + '  IfNull(TotalIntervalo, ''--:--'') TotalIntervalo'
    + sLineBreak + 'FROM'
    + sLineBreak + '  Horario'
    + sLineBreak + 'Where'
    + sLineBreak + 'Data Between %s';
begin
  Result := FHorarioDAO.SelectAll('Select * From Horario Where Data Between ' + pPeriodo);
end;

procedure THorario.LimparTodos;
begin
  Inicio := HORARIO_EM_BRANCO;
  Almoco := HORARIO_EM_BRANCO;
  Retorno := HORARIO_EM_BRANCO;
  Fim := HORARIO_EM_BRANCO;
end;

procedure THorario.LimparAlmocoEmDiante();
begin
  Almoco := HORARIO_EM_BRANCO;
  Retorno := HORARIO_EM_BRANCO;
  Fim := HORARIO_EM_BRANCO;
end;

procedure THorario.LimparRetornoEmDiante();
begin
  Retorno := HORARIO_EM_BRANCO;
  Fim := HORARIO_EM_BRANCO;
end;

function THorario.PeriodoAlmoco(): string;
begin
  if (HorarioInvalido(Retorno) or HorarioInvalido(Almoco)) then
    Exit(HORARIO_EM_BRANCO);

  Result := TimeToHora(HoraToTime(Retorno) - HoraToTime(Almoco));
end;

function THorario.PeriodoManha(): string;
begin
  if (HorarioInvalido(Almoco) or HorarioInvalido(Inicio)) then
    Exit(HORARIO_EM_BRANCO);

  Result := TimeToHora(HoraToTime(Almoco) - HoraToTime(Inicio));
end;

function THorario.PeriodoTarde(): string;
begin
  if (HorarioInvalido(Fim) or HorarioInvalido(Retorno)) then
    Exit(HORARIO_EM_BRANCO);

  Result := TimeToHora(HoraToTime(Fim) - HoraToTime(Retorno));
end;

function THorario.PrevisaoTerminoExpediente(): string;
begin
  if (HorarioInvalido(FInicio) or HorarioInvalido(FAlmoco)) then
    Exit(HORARIO_EM_BRANCO);

  Result :=
    TimeToHora(
      HoraToTime('08:00') -
        (HoraToTime(PeriodoManha()) + HoraToTime('00:00') - HoraToTime(RetornoSimulado())) + HoraToTime(Self.TotalIntervalos()));
end;

function THorario.SelectHorario(const pTipoHorario: TTipoHorario): string;
const
  CONSULTA_HORARIO = 'Select %s From Horario Where Data=''%s''';
begin
  if (pTipoHorario in [thNenhum, thInicioIntervalo, thFimIntervalo]) then
    Exit(HORARIO_EM_BRANCO);

  Result := FHorarioDAO.Select(Format(CONSULTA_HORARIO, [pTipoHorario.ToSQL, DataAtual()]));
end;

procedure THorario.SetAlmoco(const Value: string);
begin
  FAlmoco := Value;
  UpdateHorario(thAlmoco, FAlmoco);
  UpdateHorario(thPeriodoManha, PeriodoManha);
end;

procedure THorario.SetFim(const Value: string);
begin
  FFim := Value;
  UpdateHorario(thFim, FFim);
  UpdateHorario(thPeriodoTarde, PeriodoTarde);
  UpdateHorario(thCargaHoraria, CargaHoraria);
  UpdateHorario(thHoraExtra, HoraExtra);
  UpdateHorario(thAtraso, Atraso);
  UpdateHorario(thTotalIntervalo, TotalIntervalos);
end;

procedure THorario.SetInicio(const Value: string);
begin
  FInicio := Value;
  UpdateHorario(thInicio, FInicio);
end;

procedure THorario.SetInicioIntervalo(const pHora: string; const pIndiceIntervalo: Integer);
var
  lHora: string;
  lIndice: Integer;
begin
  lHora := HoraAtual();

  if (HorarioValido(pHora)) then
    lHora := pHora;

  lIndice := pIndiceIntervalo;

  if (pIndiceIntervalo = -1) then
    lIndice := Intervalo.Count-1;

  if ((Intervalo.Count = 0)) then
    Intervalo.Add(TIntervalo.Create(lHora))
  else
    Intervalo[lIndice].InicioIntervalo := lHora;

  UpdateIntervalo();
end;

procedure THorario.SetFimIntervalo(const pHora: string; const pIndiceIntervalo: Integer);
var
  lHora: string;
  lIndice: Integer;
begin
  lHora := HoraAtual();

  if (HorarioValido(pHora)) then
    lHora := pHora;

  lIndice := pIndiceIntervalo;

  if (pIndiceIntervalo = -1) then
  begin
    lIndice := Intervalo.Count-1;
    Intervalo.Add(TIntervalo.Create(HORARIO_EM_BRANCO));
  end;

  Intervalo[lIndice].FimIntervalo := lHora;

  UpdateIntervalo();
end;

procedure THorario.SetRetorno(const Value: string);
begin
  FRetorno := Value;
  UpdateHorario(thRetorno, FRetorno);
  UpdateHorario(thPeriodoAlmoco, PeriodoAlmoco);
end;

function THorario.TotalIntervalos: string;
var
  lIntervalo: TIntervalo;
  lTotalIntervalo: string;
begin
  Result := HORARIO_ZERADO;

  if (Self.Intervalo.Count = 0) then
    Exit;

   lTotalIntervalo := HORARIO_ZERADO;

  for lIntervalo in Intervalo do
  begin
    if (HorarioValido(lIntervalo.TotalIntervalo)) then
      lTotalIntervalo := TimeToHora(HoraToTime(lTotalIntervalo) + HoraToTime(lIntervalo.TotalIntervalo));
  end;

  Result := lTotalIntervalo;
end;

procedure THorario.UpdateHorario(const pTipoHorario: TTipoHorario; const pHora: string);
const
  UPDATE_HORARIO = 'Update Horario Set %s = ''%s'' Where Data=''%s''';
begin
  if (pTipoHorario in [thNenhum, thInicioIntervalo, thFimIntervalo]) then
    Exit();

  FHorarioDAO.Update(Format(UPDATE_HORARIO, [pTipoHorario.ToSQL, pHora, DataAtual()]));
end;

procedure THorario.UpdateIntervalo();
const
  DELETE_INTERVALO = 'Delete From Intervalo Where Data=''%s''';
  INSERT_INTERVALO = 'Insert Into Intervalo (Data, Inicio, Fim, TotalIntervalo) Values %s';
var
  lIntervalo: TIntervalo;
  lDataAtual: string;
  lValores: string;
begin
  lDataAtual := DataAtual();

  FHorarioDAO.Delete(Format(DELETE_INTERVALO, [lDataAtual]));

  lValores := EmptyStr;

  for lIntervalo in Intervalo do
  begin
    lValores :=
      lvalores + '(' +
      QuotedStr(lDataAtual) + ', ' +
      QuotedStr(lIntervalo.InicioIntervalo) + ', ' +
      QuotedStr(lIntervalo.FimIntervalo) + ', ' +
      QuotedStr(lIntervalo.TotalIntervalo) +'), ';
  end;

  lValores := Copy(lValores, 1, Length(lValores)-2);

  FHorarioDAO.Insert(Format(INSERT_INTERVALO, [lValores]));
end;

procedure THorario.ValidarHorario(const pTipoHorario: TTipoHorario; const pHora: string);
var
  lHora: string;
begin
  lHora := HoraAtual();

  if (HorarioValido(pHora)) then
    lHora := pHora;

  case pTipoHorario of
    thInicio: AbortarMarcacaoCasoInicioInvalido(lHora);
    thAlmoco: AbortarMarcacaoAlmocoCasoInvalido(lHora);
    thRetorno: AbortarMarcacaoRetornoCasoInvalido(lHora);
    thFim: AbortarMarcacaoFimCasoInvalido(lHora);
  end;
end;

procedure THorario.AbortarMarcacaoCasoInicioInvalido(const pHora: string);
const
  INICIO_EXPEDIENTE = 'O início de expediente deve ser entre %s e %s.';
begin
  if ((HoraToTime(pHora) < HoraToTime(FLimiteInicioJornadaTrabalho)) or
      (HoraToTime(pHora) > HoraToTime(FLimiteFimJornadaTrabalho))) then
    TfrmMensagem.ExibirMensagem(Format(INICIO_EXPEDIENTE, [FLimiteInicioJornadaTrabalho, FLimiteFimJornadaTrabalho]));
end;

procedure THorario.AbortarMarcacaoAlmocoCasoInvalido(const pHora: string);
const
  ALMOCO = 'O início do almoço deve ser maior que %s e menor que %s.';
begin
  if ((HoraToTime(pHora) <= HoraToTime(Inicio)) or (HoraToTime(pHora) > HoraToTime(FLimiteFimJornadaTrabalho))) then
    TfrmMensagem.ExibirMensagem(Format(ALMOCO, [Inicio, FLimiteFimJornadaTrabalho]));
end;

procedure THorario.AbortarMarcacaoRetornoCasoInvalido(const pHora: string);
const
  RETORNO = 'O retorno do almoço deve ter no mínimo 30 minutos de intervalo, deve ser maior que %s e menor que %s.';
begin
  if ((HoraToTime(pHora) < (HoraToTime(FAlmoco) + HoraToTime('00:30'))) or
      (HoraToTime(pHora) < HoraToTime(FAlmoco)) or
      (HoraToTime(pHora) > HoraToTime(FLimiteFimJornadaTrabalho))) then
    TfrmMensagem.ExibirMensagem(Format(RETORNO, [FAlmoco, FLimiteFimJornadaTrabalho]));
end;

procedure THorario.AbortarMarcacaoFimCasoInvalido(const pHora: string);
const
  FIM_EXPEDIENTE = 'O fim de expediente deve ser menor que %s.';
  INTERVALO_FIM_EXPEDIENTE = 'O fim de expediente deve ser maior que %s e menor que %s.';
begin
  if (HorarioInvalido(FRetorno)) then
  begin
    if (HoraToTime(pHora) > HoraToTime('23:59')) then
      TfrmMensagem.ExibirMensagem(Format(FIM_EXPEDIENTE, [FLimiteFimJornadaTrabalho]));

    Exit;
  end;

  if ((HoraToTime(pHora) < HoraToTime(FRetorno)) or (HoraToTime(HoraAtual()) > HoraToTime(FLimiteFimJornadaTrabalho))) then
    TfrmMensagem.ExibirMensagem(Format(INTERVALO_FIM_EXPEDIENTE, [FRetorno, FLimiteFimJornadaTrabalho]));
end;



function THorario.ProximaMarcacao(): TTipoHorario;
begin
  Result := thNenhum;

  if (HorarioInvalido(Inicio)) then
    Exit(thInicio);

  if (FIntervalo.Count > 0) then
    if (HorarioValido(Intervalo[Intervalo.Count-1].FInicioIntervalo) or HorarioValido(Intervalo[Intervalo.Count-1].FFimIntervalo)) then
      if (HorarioInvalido(Intervalo[Intervalo.Count-1].FFimIntervalo)) then
        Exit(thFimIntervalo);

  if (HorarioValido(FInicio) and
      HorarioInvalido(FAlmoco) and
      HorarioInvalido(FRetorno) and
      HorarioValido(FFim)) then
    Exit(thNenhum);

  if (HorarioInvalido(Almoco)) then
    Exit(thAlmoco);

  if (HorarioInvalido(Retorno)) then
    Exit(thRetorno);

  if (HorarioInvalido(Fim)) then
    Exit(thFim);
end;

procedure THorario.RemoverIntervalo(const pIndice: Integer);
begin
  Intervalo.Delete(pIndice);
  UpdateIntervalo();
end;

function THorario.RetornoSimulado: string;
begin
  Result := HoraAtual(); //'13:00';//HoraAtual();

  if (HorarioValido(FRetorno)) then
    Result := FRetorno;
end;

{ TTipoHorario_Helper }

function TTipoHorario_Helper.Anterior: TTipoHorario;
begin
  if (Self = thNenhum) then
    Exit(thNenhum);

  Result := TTipoHorario(Integer(Self)-1);
end;

function TTipoHorario_Helper.GetHorario(const pHorario: THorario): string;
begin
  case Self of
    thInicio: Result := pHorario.Inicio;
    thAlmoco: Result := pHorario.Almoco;
    thRetorno: Result := pHorario.Retorno;
    thFim, thNenhum: Result := pHorario.Fim;
    thInicioIntervalo: Result := pHorario.Intervalo[pHorario.Intervalo.Count -1].InicioIntervalo;
    thFimIntervalo: Result := pHorario.Intervalo[pHorario.Intervalo.Count -1].FimIntervalo;
  else
    Result := HORARIO_EM_BRANCO;
  end;
end;

procedure TTipoHorario_Helper.SetHorario(const pHorario: THorario; const pHora: string);
var
  lHora: string;
begin
  lHora := HoraAtual();

  if (pHora <> HORARIO_EM_BRANCO) then
    lHora := pHora;

  case Self of
    thInicio: pHorario.Inicio := lHora;//'08:11'; // lHora;
    thAlmoco: pHorario.Almoco := lHora;//'12:23'; //lHora;
    thRetorno: pHorario.Retorno := lHora;//'14:19'; //lHora;
    thFim: pHorario.Fim := lHora;//'17:29'; //lHora;
  end;
end;

function TTipoHorario_Helper.ToString: string;
begin
  case Self of
    thInicio: Result := 'Início do expediente';
    thAlmoco: Result := 'Almoço';
    thRetorno: Result := 'Retorno';
    thFim: Result := 'Fim do expediente';
    thInicioIntervalo: Result := 'Início do intervalo';
    thFimIntervalo: Result := 'Fim do intervalo';
  else
    Result := 'Fim do expediente';
  end;
end;

function TTipoHorario_Helper.ToSQL: string;
begin
  case Self of
    thInicio: Result := 'Inicio';
    thAlmoco: Result := 'Almoco';
    thRetorno: Result := 'Retorno';
    thFim: Result := 'Fim';
    thInicioIntervalo: Result := 'InicioIntervalo';
    thFimIntervalo: Result := 'FimIntervalo';
    thPeriodoManha: Result := 'PeriodoManha';
    thPeriodoAlmoco: Result := 'PeriodoAlmoco';
    thPeriodoTarde: Result := 'PeriodoTarde';
    thCargaHoraria: Result := 'CargaHoraria';
    thHoraExtra: Result := 'HoraExtra';
    thAtraso: Result := 'Atraso';
    thTotalIntervalo: Result := 'TotalIntervalo';
  else
    Result := '';
  end;
end;

{ TIntervalo }

constructor TIntervalo.Create(const pHoraInicioIntervalo: string);
begin
  FInicioIntervalo := pHoraInicioIntervalo;
end;

function TIntervalo.GetFimIntervalo: string;
begin
  Result := FFimIntervalo;

  if (HorarioInvalido(FFimIntervalo)) then
    Result := HORARIO_EM_BRANCO;
end;

function TIntervalo.GetInicioIntervalo: string;
begin
  Result := FInicioIntervalo;
end;

procedure TIntervalo.SetFimIntervalo(const Value: string);
begin
  FFimIntervalo := Value;
end;

procedure TIntervalo.SetInicioIntervalo(const Value: string);
begin
  FInicioIntervalo := Value;
end;

function TIntervalo.TotalIntervalo(): string;
begin
  Result := HORARIO_EM_BRANCO;

  if ((HorarioValido(FInicioIntervalo)) and (HorarioValido(FFimIntervalo))) then
    Result := TimeToHora(HoraToTime(FFimIntervalo) - HoraToTime(FInicioIntervalo));
end;

end.
