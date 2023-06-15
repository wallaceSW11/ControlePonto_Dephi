unit frameHorario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  ComponentUtils;

type
  TQuadroHorario = class(TFrame)
    pnlIntervaloAlmoco: TPanel;
    pnlLateral1: TPanel;
    pnlHoraInicio: TPanel;
    lblTitulo: TLabel;
    lblHora: TLabel;
    pnl21: TPanel;
    pnlRemoverHorario: TPanel;
    imgRemoverHorario: TImage;
    pnlEditarHorario: TPanel;
    imgEditarHorario: TImage;
    pnl22: TPanel;
    pnlAddHorario: TPanel;
    imgAdicionarHorario: TImage;
    procedure imgEditarHorarioMouseEnter(Sender: TObject);
    procedure imgRemoverHorarioMouseEnter(Sender: TObject);
    procedure imgRemoverHorarioMouseLeave(Sender: TObject);
    procedure imgEditarHorarioMouseLeave(Sender: TObject);
    procedure imgAdicionarHorarioMouseEnter(Sender: TObject);
    procedure imgAdicionarHorarioMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TQuadroHorario.imgRemoverHorarioMouseEnter(Sender: TObject);
begin
  MostrarBorda(pnlRemoverHorario);
end;

procedure TQuadroHorario.imgRemoverHorarioMouseLeave(Sender: TObject);
begin
  MostrarBorda(pnlRemoverHorario, False);
end;

procedure TQuadroHorario.imgEditarHorarioMouseEnter(Sender: TObject);
begin
  MostrarBorda(pnlEditarHorario);
end;

procedure TQuadroHorario.imgEditarHorarioMouseLeave(Sender: TObject);
begin
  MostrarBorda(pnlEditarHorario, False);
end;

procedure TQuadroHorario.imgAdicionarHorarioMouseEnter(Sender: TObject);
begin
  MostrarBorda(pnlAddHorario);
end;

procedure TQuadroHorario.imgAdicionarHorarioMouseLeave(Sender: TObject);
begin
  MostrarBorda(pnlAddHorario, False);
end;

end.
