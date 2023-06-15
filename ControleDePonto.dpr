program ControleDePonto;

uses
  Vcl.Forms,
  TelaPrincipal in 'Telas\TelaPrincipal.pas' {frmPrincipal},
  TelaHorario in 'Telas\TelaHorario.pas' {frmHorario},
  LibMessages in 'Lib\LibMessages.pas',
  LibTypes in 'Lib\LibTypes.pas',
  uTEditHelper in 'Helpers\uTEditHelper.pas',
  frameHorario in 'Frames\frameHorario.pas' {QuadroHorario: TFrame},
  Horario in 'Models\Horario.pas',
  HorarioUtils in 'Lib\HorarioUtils.pas',
  ComponentUtils in 'Lib\ComponentUtils.pas',
  TelaMensagem in 'Telas\TelaMensagem.pas' {frmMensagem},
  Lib in 'Lib\Lib.pas',
  HorarioDAO in 'DAO\HorarioDAO.pas',
  TelaCalculoIntervalo in 'Telas\TelaCalculoIntervalo.pas' {frmCalculoIntervalo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
