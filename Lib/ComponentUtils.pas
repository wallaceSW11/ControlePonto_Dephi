unit ComponentUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

procedure DestruirComponentes(pComponentePai: TWinControl);
procedure OrdenarComponente(pComponentePai: TWinControl);
procedure MostrarBorda(const pPainel: TPanel; const pMostrar: Boolean = True);

implementation

procedure DestruirComponentes(pComponentePai: TWinControl);
var
  I: Integer;
  lInstancia : Tcontrol;
begin
  I := pComponentePai.ControlCount;

  while (I <> 0) do
  begin
    lInstancia := pComponentePai.Controls[I-1];
    pComponentePai.RemoveControl(lInstancia);
    lInstancia.Destroy();
    I:= pComponentePai.ControlCount;
  end;

end;

procedure OrdenarComponente(pComponentePai: TWinControl);
var
  I: Integer;
begin
  for I := pComponentePai.ControlCount-1 downto 0 do
    if (pComponentePai.Controls[I] is TPanel) then
      (pComponentePai.Controls[I]).Align := alNone;

  for I := pComponentePai.ControlCount-1 downto 0 do
    if (pComponentePai.Controls[I] is TPanel) then
      (pComponentePai.Controls[I]).Align := alTop;
end;

procedure MostrarBorda(const pPainel: TPanel; const pMostrar: Boolean);
begin
  if (pMostrar) then
    pPainel.BevelOuter := bvRaised
  else
    pPainel.BevelOuter := bvNone;
end;

end.
