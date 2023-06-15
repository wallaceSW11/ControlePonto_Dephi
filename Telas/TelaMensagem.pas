unit TelaMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.AppEvnts, System.ImageList, Vcl.ImgList;

type
  TfrmMensagem = class(TForm)
    tmShow: TTimer;
    tmClose: TTimer;
    pnlMain: TPanel;
    pnlQuadro: TPanel;
    pnlTop: TPanel;
    lblTitulo: TLabel;
    pnlMensagem: TPanel;
    pnlBotao: TPanel;
    btnOk: TButton;
    pnlIcone: TPanel;
    pnlMensagemPrincipal: TPanel;
    lblMensagem: TLabel;
    imgIcone: TImage;
    pnlLateral1: TPanel;
    btnSim: TButton;
    btnNao: TButton;
    ilMensagem: TImageList;
    imgPergunta: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmShowTimer(Sender: TObject);
    procedure tmCloseTimer(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ApplicationEvents1ModalEnd(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
  private
    procedure FecharTela;

    { Private declarations }
  public
    { Public declarations }
    class procedure ExibirMensagem(const pMensagem: string; const pTitulo: string = 'Informação'; const pAbort: Boolean = True);
    class function Confirma(const pMensagem: string; const pTitulo: string = 'Confirmação'): Boolean; static;
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

procedure TfrmMensagem.FecharTela();
begin
  Enabled := False;
  AlphaBlend := True;
  tmClose.Enabled := True;
end;

procedure TfrmMensagem.ApplicationEvents1ModalEnd(Sender: TObject);
begin
  btnOk.SetFocus;
end;

procedure TfrmMensagem.btnOkClick(Sender: TObject);
begin
  FecharTela();
end;

procedure TfrmMensagem.btnSimClick(Sender: TObject);
begin
  FecharTela();
  ModalResult := 1;
end;

class procedure TfrmMensagem.ExibirMensagem(const pMensagem: string; const pTitulo: string; const pAbort: Boolean);
begin
  frmMensagem := TfrmMensagem.Create(nil);

  try
    frmMensagem.lblTitulo.Caption := pTitulo;
    frmMensagem.lblMensagem.Caption := pMensagem;
    frmMensagem.btnSim.Visible := False;
    frmMensagem.btnNao.Visible := False;
    frmMensagem.ShowModal();

    if (pAbort) then
      Abort;
  finally
    frmMensagem.Free();
  end;
end;

class function TfrmMensagem.Confirma(const pMensagem: string; const pTitulo: string): Boolean;
begin
  frmMensagem := TfrmMensagem.Create(nil);

  try
    frmMensagem.lblTitulo.Caption := pTitulo;
    frmMensagem.lblMensagem.Caption := pMensagem;
    frmMensagem.btnSim.Visible := True;
    frmMensagem.btnNao.Visible := True;
    frmMensagem.btnOk.Visible := False;
    frmMensagem.imgIcone.Visible := False;
    frmMensagem.imgPergunta.Visible := True;
    frmMensagem.ShowModal();

    Result := (frmMensagem.ModalResult = 1);
  finally
    frmMensagem.Free();
  end;
end;

procedure TfrmMensagem.FormCreate(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 0;
end;

procedure TfrmMensagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmMensagem.FormShow(Sender: TObject);
begin
  Enabled := False;
  tmShow.Enabled := True;
end;

procedure TfrmMensagem.tmCloseTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 30;

  if AlphaBlendValue < 11 then
  begin
    tmClose.Enabled := False;
    Close();
  end;
end;

procedure TfrmMensagem.tmShowTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue + 30;

  if AlphaBlendValue > 220 then
  begin
    tmShow.Enabled := False;
    //AlphaBlend := False;
    Enabled := True;
  end;
end;

end.
