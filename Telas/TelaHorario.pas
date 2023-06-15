unit TelaHorario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Horario,
  HorarioUtils, TelaMensagem;

type
  TfrmHorario = class(TForm)
    pnlMainTop: TPanel;
    pnl4: TPanel;
    lblTituloHorario: TLabel;
    pnl5: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    Panel1: TPanel;
    pnl3: TPanel;
    btnCancelar: TBitBtn;
    pnl6: TPanel;
    edtHora: TEdit;
    pnl12: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtHoraKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtHoraKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Panel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtHoraExit(Sender: TObject);
  private
    FHorario: THorario;
    FHora: string;
    FHoraOriginal: string;
    FTipoHorario: TTipoHorario;
  public
//    class function Exibir(const pTipoHorario: TTipoHorario; const pHora: string): string;
    class function HorarioInformadoValido(const pTipoHorario: TTipoHorario; const pHora: string; out pHoraInformada: string; const pHorario: THorario = nil): Boolean; static;
  end;

var
  frmHorario: TfrmHorario;

implementation

uses
  LibMessages, uTEditHelper;

{$R *.dfm}

class function TfrmHorario.HorarioInformadoValido(const pTipoHorario: TTipoHorario; const pHora: string; out pHoraInformada: string; const pHorario: THorario = nil): Boolean;
begin
  frmHorario := TfrmHorario.Create(nil);

  try
    frmHorario.lblTituloHorario.Caption := pTipoHorario.ToString();
    frmHorario.FTipoHorario := pTipoHorario;
    frmHorario.FHorario := pHorario;

    if (HorarioValido(pHora)) then
    begin
      frmHorario.edtHora.Text := pHora;
      frmHorario.FHoraOriginal := pHora;
    end;

    Result := (frmHorario.ShowModal() = 1);
    pHoraInformada := frmHorario.FHora;
  finally
    frmHorario.Free();
  end;
end;

procedure TfrmHorario.BitBtn1Click(Sender: TObject);
begin
  FHora := FHoraOriginal;
  Close();
end;

procedure TfrmHorario.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmHorario.btnOkClick(Sender: TObject);
begin
  if ((Length(edtHora.Text) < 4) or (Pos(':', edtHora.Text) <> 3) or (HorarioInvalido(edtHora.Text))) then
  begin
    edtHora.Focar();
    TfrmMensagem.ExibirMensagem('Horário informado é inválido.');
  end;

  FHorario.ValidarHorario(FTipoHorario, edtHora.Text);

  FHora := edtHora.Text;
  Close();
  ModalResult := 1;
end;

procedure TfrmHorario.edtHoraExit(Sender: TObject);
begin
  case Length(edtHora.Text) of
    3: edtHora.Text := Copy(edtHora.Text, 1, 3) + '00';
    4: edtHora.Text := Copy(edtHora.Text, 1, 4) + '0';
    2: edtHora.Text := Copy(edtHora.Text, 1, 2) + ':00'
  end;
end;

procedure TfrmHorario.edtHoraKeyPress(Sender: TObject; var Key: Char);
begin
  edtHora.SomenteTeclasHorario(Sender, Key);
end;

procedure TfrmHorario.edtHoraKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edtHora.AdicionarDoisPontosNoKeyUp(Sender, Key, Shift);
end;

procedure TfrmHorario.FormCreate(Sender: TObject);
begin
  FHora := EmptyStr;
  FHoraOriginal := EmptyStr;
end;

procedure TfrmHorario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmHorario.FormShow(Sender: TObject);
begin
  edtHora.SetFocus();
end;

procedure TfrmHorario.Panel1Click(Sender: TObject);
begin
  FHora := FHoraOriginal;
  Close();
end;

end.
