unit TelaCalculoIntevalo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCalculoIntevalo = class(TForm)
    edtHoraInicio: TEdit;
    edtHoraFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculoIntevalo: TfrmCalculoIntevalo;

implementation

{$R *.dfm}

end.
