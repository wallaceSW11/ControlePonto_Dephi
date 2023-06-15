unit uTEditHelper;

interface

uses
  vcl.stdCtrls, SysUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Variants, System.Classes,
  WinApi.Windows;

type
  TCurrencyHelper = record helper for Currency
    function ValorMonetario(): string;
    function ValorMonetarioSifrao(): string;
  end;

  TDoubleHelper = record helper for double
    function ValorMonetario: string;
    function ValorMonetarioSifrao(): String;
    function VlMonetario: string;
    function ToString: string;
  end;

  TDataSetHelper = class helper for TDataSet
    procedure EstaEmEdicao(pEdicao: boolean);
  end;
type
  TValorMonetario = class
  public
    class function ValorMonetario(const pValor: String): String;
    class function ValorMonetarioSifrao(const pValor: String): String;
  end;

type
  TEditHelper = class helper for TEdit
  public
    function IsEmpty:Boolean;
    procedure Focar;
    function ValidarNumero:Double;
    function IsValid:Boolean;
    function Float:Double;
    function ToFloat(): Double;
    function ToCurrency(): Currency;
    function Zerado:string;
    function ZeradoComVirgula:string;
    function TrocarVirgulaPorPonto: String;
    function SemPontuacao(): string;
    function ToInteger(): Integer;
    function FormatarValorMonetario(): string;
    procedure SomenteNumeroEVirgula(Sender: TObject; var Key: Char);
    procedure SomenteNumero(Sender: TObject; var Key: Char);
    procedure SomenteTeclasHorario(Sender: TObject; var Key: Char);
    procedure AdicionarDoisPontosNoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

  TGridHelper = class
    class procedure AjustarColunasGrid(const pDBGrid: TDBGrid; const pColunaPrincipal: Integer);
  end;




implementation

{ TEditHelper }

function TEditHelper.Float: Double;
var
  lValorSemPonto: String;
begin
  lValorSemPonto := StringReplace(Self.Text, '.', EmptyStr, [rfReplaceAll]);

  Result := StrToFloatDef(lValorSemPonto, 0);
end;

procedure TEditHelper.Focar;
begin
  if (Self.CanFocus) then
  begin
    Self.SetFocus;
    Self.SelectAll;
  end;
end;

function TEditHelper.FormatarValorMonetario(): string;
begin
  if (Self is TEdit) then
    TEdit(Self).Text := TValorMonetario.ValorMonetario(TEdit(Self).Text);
end;

function TEditHelper.ToCurrency: Currency;
var
  lTexto: string;
begin
  FormatSettings.DecimalSeparator := ',';
  lTexto := string(Self.Text).Replace('.', EmptyStr);
  Result := StrToCurr(lTexto);
end;

function TEditHelper.ToFloat: Double;
begin
  Result := StrToFloat(FormatFloat('#,##0.00', StrToFloatDef(Self.Text, 0)));
end;

function TEditHelper.ToInteger(): Integer;
begin
  Result := StrToIntDef(Self.Text, 0);
end;

function TEditHelper.TrocarVirgulaPorPonto(): String;
begin
  Result := string(Self.Text).Replace('.', EmptyStr).Replace(',', '.');
end;

function TEditHelper.IsEmpty:Boolean;
begin
 Result := Trim(Self.Text).IsEmpty;
end;


function TEditHelper.IsValid: Boolean;
begin
  Result := Trim(Self.Text) <> '';
end;

function TEditHelper.SemPontuacao: string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(Self.Text));
end;

procedure TEditHelper.SomenteNumeroEVirgula(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(key, ['0'..'9','.',',',#8,#13])) then
    key := #0;

  if CharInSet(key, [',','.']) then
    key := FormatSettings.DecimalSeparator;

  if key = FormatSettings.DecimalSeparator then
    if pos(key,TEdit(Sender).Text) <> 0 then
      key := #0;
end;

procedure TEditHelper.SomenteTeclasHorario(Sender: TObject; var Key: Char);
var
  lTamanhoTexto: Integer;
begin
  if (not(CharInSet(key, ['0'..'9', ':', #8, #13]))) then
    key := #0;

  if (CharInSet(Key, [#8, #13])) then
    Exit;

  lTamanhoTexto := Length(Tedit(Sender).Text);

  if key = ':' then
    if pos(key, TEdit(Sender).Text) <> 0 then
      key := #0;

  case lTamanhoTexto of
    0:
      begin
        if (not(CharInSet(key, ['0'..'2']))) then
          key := #0;
      end;
    1:
      begin
        if (CharInSet(TEdit(Sender).Text[1], ['0','1'])) then
          begin
            if (not(CharInSet(key, ['0'..'9']))) then
              key := #0;
          end
        else
          if (not(CharInSet(key, ['0'..'3']))) then
          key := #0;
      end;
    5:
      begin
        if (not(CharInSet(key, ['0'..'9']))) then
          key := #0;
      end;
    2:
      begin
        if ((Pos(':', TEdit(Sender).Text) <> 3) and (Key <> ':')) then
          Key := #0;
      end;
    3:
      begin
        if (not(CharInSet(key, ['0'..'5']))) then
          key := #0;
      end;
    4:
      begin
        if (not(CharInSet(key, ['0'..'9']))) then
          key := #0;
      end;
  end;
end;

procedure TEditHelper.AdicionarDoisPontosNoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_BACK, VK_DELETE] then
    Exit;

  if (Length(Self.Text) = 2) then
  begin
    Self.Text := Self.Text + ':';
    Self.SelStart := 3;
  end;
end;

procedure TEditHelper.SomenteNumero(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(key, ['0'..'9',#8,#13])) then
    key := #0;

  if key = FormatSettings.DecimalSeparator then
    if pos(key,TEdit(Sender).Text) <> 0 then
      key := #0;
end;

function TEditHelper.ValidarNumero;
var
  lValor:Variant;
begin
  lValor := Self.Text;

  if ((lValor = null) or (lValor = '')) then
    Result := 0
  else
    Result := StrToFloat(Self.Text);
end;



function TEditHelper.Zerado: string;
begin
  Self.Text := '0';
end;

function TEditHelper.ZeradoComVirgula: string;
begin
  Self.Text := '0,00';
end;

function TDoubleHelper.ValorMonetario: string;
begin
  result := FormatFloat('#,##0.00', Self);
end;

function TDoubleHelper.ValorMonetarioSifrao: String;
begin
  result := FormatFloat('R$ #,##0.00', Self);
end;

function TDoubleHelper.VlMonetario: string;
begin
  result := StringReplace(FloatToStr(Self), ',','.', [rfReplaceAll, rfIgnoreCase]);
end;


function TDoubleHelper.ToString: string;
begin
  result := floattostr(self);
end;


{ THelperString }

class function TValorMonetario.ValorMonetario(const pValor: String): String;
var
  lValorSemVirgula: String;
begin
  lValorSemVirgula := pValor.Replace('.', EmptyStr);

  Result := FormatFloat('#,##0.00', StrToFloatDef(lValorSemVirgula, 0));
end;

class function TValorMonetario.ValorMonetarioSifrao(const pValor: String): String;
begin
  Result := FormatFloat('R$ #,##0.00', StrToFloatDef(pValor, 0));
end;

{ TDataSetHelper }

procedure TDataSetHelper.EstaEmEdicao(pEdicao: boolean);
begin
  if (pEdicao) then
    Self.Edit()
  else
    Self.Append();
end;

{ TCurrencyHelper }

function TCurrencyHelper.ValorMonetario: string;
begin
  Result := FormatFloat('#,##0.00', Self);
end;

function TCurrencyHelper.ValorMonetarioSifrao: string;
begin
  Result := FormatFloat('R$ #,##0.00', Self);
end;

{ TGridHelper }

class procedure TGridHelper.AjustarColunasGrid(const pDBGrid: TDBGrid; const pColunaPrincipal: Integer);
var
  I,
  lTamanhoColunas: Integer;
begin
  lTamanhoColunas := 0;

  for I := 0 to pDBGrid.Columns.Count-1 do
  begin
    if (I = pColunaPrincipal) then
     pDBGrid.Columns[I].Width := 0;

    lTamanhoColunas :=  lTamanhoColunas + pDBGrid.Columns[I].Width;
  end;

  pDBGrid.Columns[pColunaPrincipal].Width := (pDBGrid.Width - 30) - lTamanhoColunas;
end;

end.
