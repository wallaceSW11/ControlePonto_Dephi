unit TelaCalculoIntervalo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Clipbrd,
  Vcl.ExtCtrls, Vcl.Buttons, uTEditHelper;

type
  TfrmCalculoIntervalo = class(TForm)
    pnlHoraInicio: TPanel;
    pnlHoraFinal: TPanel;
    pnlMainTop: TPanel;
    pnl4: TPanel;
    lblTituloHorario: TLabel;
    pnl5: TPanel;
    pnl6: TPanel;
    edtHoraInicio: TEdit;
    pnl12: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    Panel9: TPanel;
    edtHoraFinal: TEdit;
    Panel10: TPanel;
    Panel1: TPanel;
    lblHorario: TLabel;
    btnFechar: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure edtHoraFinalExit(Sender: TObject);
    procedure lblHorarioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtHoraInicioKeyPress(Sender: TObject; var Key: Char);
    procedure edtHoraInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHoraFinalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHoraFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   class procedure AbrirTela;
  end;

var
  frmCalculoIntervalo: TfrmCalculoIntervalo;

implementation

{$R *.dfm}

class procedure TfrmCalculoIntervalo.AbrirTela;
begin
  frmCalculoIntervalo := TfrmCalculoIntervalo.Create(nil);
  frmCalculoIntervalo.ShowModal;
end;

procedure TfrmCalculoIntervalo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalculoIntervalo.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalculoIntervalo.edtHoraFinalExit(Sender: TObject);
begin
  if ((Trim(edtHoraInicio.Text).IsEmpty) or (Trim(edtHoraFinal.Text).IsEmpty)) then
    Exit;

  lblHorario.Caption := FormatDateTime('HH:MM', StrToTime(edtHoraFinal.Text) - StrToTime(edtHoraInicio.Text));

end;

procedure TfrmCalculoIntervalo.edtHoraFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  edtHoraFinal.SomenteTeclasHorario(Sender, Key);
end;

procedure TfrmCalculoIntervalo.edtHoraFinalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtHoraFinal.AdicionarDoisPontosNoKeyUp(Sender, Key, Shift);
end;

procedure TfrmCalculoIntervalo.edtHoraInicioKeyPress(Sender: TObject;
  var Key: Char);
begin
  edtHoraInicio.SomenteTeclasHorario(Sender, Key);
end;

procedure TfrmCalculoIntervalo.edtHoraInicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtHoraInicio.AdicionarDoisPontosNoKeyUp(Sender, Key, Shift);
end;

procedure TfrmCalculoIntervalo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and (not(ActiveControl.ClassType = TMemo))) then
    Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmCalculoIntervalo.FormShow(Sender: TObject);
begin
  edtHoraInicio.SetFocus;
end;

procedure TfrmCalculoIntervalo.lblHorarioClick(Sender: TObject);
begin
  Clipboard.AsText := lblHorario.Caption;
  ShowMessage('Copiado!');
end;

end.
