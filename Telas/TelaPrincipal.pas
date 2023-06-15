unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ButtonGroup, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.CategoryButtons, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.Menus, Vcl.AppEvnts, Horario, Data.DB, Vcl.Grids, Vcl.DBGrids, frameHorario, LibMessages, TelaHorario,
  StrUtils, System.Notification, HorarioUtils, ComponentUtils, Datasnap.DBClient, DateUtils, System.Win.ComObj,
  TelaCalculoIntervalo;


type
  TfrmPrincipal = class(TForm)
    svMenuPrincipal: TSplitView;
    pnlPrincipal: TPanel;
    pnlMenuTop: TPanel;
    cbtnMenu: TCategoryButtons;
    alMenu: TActionList;
    img48x48: TImageList;
    pgcPrincipal: TPageControl;
    tsHome: TTabSheet;
    pnlDados: TPanel;
    pnlDadosDetalhe: TPanel;
    pnlHomeTop: TPanel;
    lblHomeTitle: TLabel;
    lblData: TLabel;
    pnlMainTop: TPanel;
    btnFechar: TSpeedButton;
    btnMinimizar: TSpeedButton;
    pnlMarcaoPonto: TPanel;
    actHome: TAction;
    actRelatorio: TAction;
    actAuditoria: TAction;
    actSetup: TAction;
    imgMenu: TImage;
    pnl10: TPanel;
    pnl11: TPanel;
    lblInicio: TLabel;
    lblIntervaloAlmoco: TLabel;
    lblPeriodoTarde: TLabel;
    lblCargaHoraria: TLabel;
    lblHoraExtra: TLabel;
    lblAtraso: TLabel;
    lblHoraPeriodoManha: TLabel;
    lblHoraPeriodoAlmoco: TLabel;
    lblHoraPeriodoTarde: TLabel;
    lblHoraCargaHoraria: TLabel;
    lblHoraHoraExtra: TLabel;
    lblHoraAtraso: TLabel;
    tsRelatorio: TTabSheet;
    pnlTopRelatorio: TPanel;
    lblRelatorio: TLabel;
    pnlRelatorio: TPanel;
    tsAuditoria: TTabSheet;
    tsSetup: TTabSheet;
    pnlAuditoriaTop: TPanel;
    lblAuditoria: TLabel;
    pnlAuditoria: TPanel;
    lblDataInicialAuditoria: TLabel;
    lblDataFinalAuditoria: TLabel;
    dtInicialAuditoria: TDateTimePicker;
    dtFinalAuditoria: TDateTimePicker;
    pnlFiltrarAuditoria: TPanel;
    btnFiltrarAuditoria: TSpeedButton;
    lvAuditoria: TListView;
    mmAuditoria: TMemo;
    pnlTopSetup: TPanel;
    lblSetup: TLabel;
    pnlSetup: TPanel;
    pnl13: TPanel;
    lblSetupCargaHoraria: TLabel;
    pnl12: TPanel;
    edtJornada: TEdit;
    pnlTolerancia: TPanel;
    lblTempoTelerancia: TLabel;
    pnl15: TPanel;
    edtTolerancia: TEdit;
    tiPrincipal: TTrayIcon;
    aePrincipal: TApplicationEvents;
    pmPrincipal: TPopupMenu;
    mniAbrirTela: TMenuItem;
    mniMarcarHorario: TMenuItem;
    mniEditarHorario: TMenuItem;
    tsIniciarComTray: TToggleSwitch;
    mniSairDoApp: TMenuItem;
    img24x24: TImageList;
    lbl4: TLabel;
    lbl6: TLabel;
    pnl14: TPanel;
    pnl16: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    pnl17: TPanel;
    spl1: TSplitter;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dtFinalRelatorio: TDateTimePicker;
    dtInicialRelatorio: TDateTimePicker;
    Panel2: TPanel;
    btnFiltrarRelatorio: TSpeedButton;
    pnl19: TPanel;
    btnExportar: TSpeedButton;
    frmeHoraInicio: TQuadroHorario;
    frmeHoraAlmoco: TQuadroHorario;
    frmeHoraRetorno: TQuadroHorario;
    frmeHoraFim: TQuadroHorario;
    mniIniciarIntervalo: TMenuItem;
    ncNotificacao: TNotificationCenter;
    pnlPrevisaoSaida: TPanel;
    lblPrevisaoSaida: TLabel;
    pnlIntervalos: TPanel;
    pnl3: TPanel;
    pnlLateral1: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    pnl5: TPanel;
    pnlDadosIntervalo: TPanel;
    sbIntervalo: TScrollBox;
    pnlSetaIntervalo: TPanel;
    lblIntervalos: TLabel;
    pnlImgSetaBaixo: TPanel;
    imgSetaBaixo: TImage;
    pnlImgSetaCima: TPanel;
    imgSetaCima: TImage;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    edtLimiteInicioJornada: TEdit;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    edtLimiteFimJornada: TEdit;
    tsMostrarNotificacao: TToggleSwitch;
    lblIntervalo: TLabel;
    lblHoraIntervalo: TLabel;
    grdRelatorio: TDBGrid;
    dsRelatorio: TDataSource;
    lblSaldo: TLabel;
    lblValorSaldo: TLabel;
    lblTipoSaldo: TLabel;
    N1: TMenuItem;
    mniCalcularintervalo: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure actRelatorioExecute(Sender: TObject);
    procedure actAuditoriaExecute(Sender: TObject);
    procedure actSetupExecute(Sender: TObject);
    procedure aePrincipalMinimize(Sender: TObject);
    procedure tiPrincipalDblClick(Sender: TObject);
    procedure mniAbrirTelaClick(Sender: TObject);
    procedure pmPrincipalPopup(Sender: TObject);
    procedure mniEditarHorarioClick(Sender: TObject);
    procedure mniSairDoAppClick(Sender: TObject);
    procedure QuadroHorario1img1Click(Sender: TObject);
    procedure frmeHoraAlmocoimg1Click(Sender: TObject);
    procedure frmeHoraRetornoimg1Click(Sender: TObject);
    procedure frmeHoraFimimg1Click(Sender: TObject);
    procedure frmeHoraInicioImage1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniMarcarHorarioClick(Sender: TObject);
    procedure frmeHoraFimImage1Click(Sender: TObject);
    procedure mniIniciarIntervaloClick(Sender: TObject);
    procedure lblIntervalosMouseEnter(Sender: TObject);
    procedure lblIntervalosMouseLeave(Sender: TObject);
    procedure lblIntervalosClick(Sender: TObject);
    procedure frmeHoraInicioimgAddHorarioClick(Sender: TObject);
    procedure frmeHoraAlmocoimgAdicionarHorarioClick(Sender: TObject);
    procedure frmeHoraRetornoimgAdicionarHorarioClick(Sender: TObject);
    procedure frmeHoraFimimgAdicionarHorarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frmeHoraAlmocoimgRemoverHorarioClick(Sender: TObject);
    procedure frmeHoraRetornoimgRemoverHorarioClick(Sender: TObject);
    procedure btnFiltrarRelatorioClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure mniCalcularintervaloClick(Sender: TObject);
  private

    FHorario: THorario;
    FProximaMarcacao: TTipoHorario;
    FLinhaIntervalo: Integer;
    FIndiceIntervalo: Integer;

    procedure IrParaPagina(const pPagina: TTabSheet);
    procedure AbrirTela();
    procedure MinimizarTela;
    procedure CarregarHorarios();
    function TituloMarcarPonto: string;
    procedure TratarQuadroFimExpediente;
    function TituloEditarPonto: string;
    procedure MostrarNotificacao();
    procedure ProcessarMarcacaoDePonto();
    procedure CriarPainelIntervalo(
      const pTextoInicioIntervalo: string = HORARIO_EM_BRANCO;
      const pTextoFimIntervalo: string = HORARIO_EM_BRANCO;
      const pTotalIntervalo: string = HORARIO_EM_BRANCO);
    procedure CriarLabelIntervalo(
      const pNomeParent: string;
      const pNomeComponente: string;
      const pTextoComponente: string;
      const pAlinhamento: TAlign;
      const pTamanho: integer);
    procedure CriarPainel(
      const pPainelParent: TWinControl;
      const pNomePainel: string;
      const pAlinhamento: TAlign;
      const pHeight: Integer);
    procedure CriarBotaoExcluirIntervalo(const pNomeParent: string);
    procedure OnClickRemoverIntervalo(Sender: TObject);

    procedure PrepararQuadroIntervalo;
    procedure ToggleIntervalo;
    procedure AtualizarProximaMarcacao(const pProximaMarcacao: TTipoHorario = thNenhum);
    procedure EditarHorarioManual(const pTipoHorario: TTipoHorario);
    procedure AjustarTamanhoTela;
    procedure AtualizarData;
    procedure OnClickEditarFimIntervalo(Sender: TObject);
    procedure OnClickEditarInicioIntervalo(Sender: TObject);
    procedure PreencherQuadroIntervalo();
    procedure AbortarMarcacaoPontoForaDaSequencia(const pTipoHorario: TTipoHorario);    
    procedure ValidarFimDeExpediente;
    procedure MarcarFimDeExpedienteCasoConfirmado();
    procedure AtualizarHorarioInicioCasoValido(const pTipoHorario: TTipoHorario);
    procedure AtualizarHorarioAlmocoCasoValido(const pTipoHorario: TTipoHorario);
    procedure AtualizarHorarioRetornoCasoValido(const pTipoHorario: TTipoHorario);
    procedure AtualizarHorarioFimExpedienteCasoValido(const pTipoHorario: TTipoHorario);
    procedure AtualizarHorarioInicioIntervaloCasoValido(const pTipoHorario: TTipoHorario);
    procedure AtualizarHorarioFimIntervaloCasoValido(const pTipoHorario: TTipoHorario);
    procedure ProcessarMarcacaoDePontoPeloMenu();
    procedure ProcessarMarcacaoDePontoPelaTela();
    procedure RemoverMarcacaoDoPontoCasoConfirmado(const pTipoHorario: TTipoHorario);
    function FiltroData: string;

    const
      ASPAS_DUPLAS = #34;
  public
    { Public declarations }
    procedure AfterConstruction(); override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses TelaMensagem, Lib;

procedure TfrmPrincipal.actAuditoriaExecute(Sender: TObject);
begin
  IrParaPagina(tsAuditoria);
end;

procedure TfrmPrincipal.actHomeExecute(Sender: TObject);
begin
  IrParaPagina(tsHome);
end;

procedure TfrmPrincipal.actRelatorioExecute(Sender: TObject);
begin
  IrParaPagina(tsRelatorio);
end;

procedure TfrmPrincipal.actSetupExecute(Sender: TObject);
begin
  IrParaPagina(tsSetup);
end;

procedure TfrmPrincipal.aePrincipalMinimize(Sender: TObject);
begin
  MinimizarTela();
end;

procedure TfrmPrincipal.AfterConstruction;
begin
  inherited;

  if (tsIniciarComTray.State = tssOn) then
    MinimizarTela();

  FHorario :=
    THorario.Create(
      edtJornada.Text,
      edtTolerancia.Text,
      edtLimiteInicioJornada.Text,
      edtLimiteFimJornada.Text);

  AtualizarProximaMarcacao();

  pnlIntervalos.Height := 40;
  lblPrevisaoSaida.Visible := False;
  FLinhaIntervalo := 0;


  dtInicialRelatorio.Date :=  Date.StartOfTheMonth;
  dtFinalRelatorio.Date := Date.EndOfTheMonth;
end;

procedure TfrmPrincipal.AtualizarHorarioFimIntervaloCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario,
  lHorarioParaEditar: string;
begin
  ValidarFimDeExpediente();

  if ((FHorario.Intervalo.Count = 0) or (HorarioInvalido(FHorario.Intervalo[FIndiceIntervalo].InicioIntervalo))) then
    AbortarMarcacaoPontoForaDaSequencia(thFimIntervalo);

  if (HorarioInvalido(FHorario.Intervalo[FIndiceIntervalo].FimIntervalo)) then
    begin
      FIndiceIntervalo := -1;
      lHorarioParaEditar := HORARIO_EM_BRANCO;
    end
  else
    lHorarioParaEditar := FHorario.Intervalo[FIndiceIntervalo].FimIntervalo;

  if (TfrmHorario.HorarioInformadoValido(pTipoHorario, lHorarioParaEditar, lHorario)) then
  begin
    FHorario.SetFimIntervalo(lHorario, FIndiceIntervalo);
    PrepararQuadroIntervalo;
  end;
end;

procedure TfrmPrincipal.AtualizarHorarioInicioIntervaloCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario: string;
begin
  ValidarFimDeExpediente();

  if (FProximaMarcacao in [thInicio, thRetorno, thFimIntervalo]) then
    AbortarMarcacaoPontoForaDaSequencia(thInicioIntervalo);

  if (FHorario.Intervalo.Count = 0) then
    begin
      if (TfrmHorario.HorarioInformadoValido(pTipoHorario, EmptyStr, lHorario)) then
      begin
        FHorario.SetInicioIntervalo(lHorario);
        AtualizarProximaMarcacao(thFimIntervalo);
      end;
    end
  else
    if (TfrmHorario.HorarioInformadoValido(pTipoHorario, FHorario.Intervalo[FIndiceIntervalo].InicioIntervalo, lHorario)) then
    begin
      FHorario.SetInicioIntervalo(lHorario, FIndiceIntervalo);
      AtualizarProximaMarcacao(thFimIntervalo);
    end;

  PrepararQuadroIntervalo();
  Abort();
end;

procedure TfrmPrincipal.AtualizarHorarioFimExpedienteCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario: string;
begin
  if ((HorarioInvalido(FHorario.Inicio)) or (FProximaMarcacao = thFimIntervalo)) then
    AbortarMarcacaoPontoForaDaSequencia(thFim);

  if ((HorarioInvalido(FHorario.Almoco)) and (HorarioInvalido(FHorario.Retorno))) then
    MarcarFimDeExpedienteCasoConfirmado();

  if ((HorarioInvalido(FHorario.Retorno)) or (FProximaMarcacao = thFimIntervalo)) then
    AbortarMarcacaoPontoForaDaSequencia(thFim);

  if (TfrmHorario.HorarioInformadoValido(pTipoHorario, pTipoHorario.GetHorario(FHorario), lHorario, FHorario)) then
    FHorario.Fim := lHorario;
end;

procedure TfrmPrincipal.AtualizarHorarioRetornoCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario: string;
begin
  if ((HorarioInvalido(FHorario.Almoco)) or (FProximaMarcacao = thFimIntervalo)) then
    AbortarMarcacaoPontoForaDaSequencia(thRetorno);

  if (TfrmHorario.HorarioInformadoValido(pTipoHorario, pTipoHorario.GetHorario(FHorario), lHorario, FHorario)) then
    FHorario.Retorno := lHorario;
end;

procedure TfrmPrincipal.AtualizarHorarioAlmocoCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario: string;
begin
  if ((HorarioInvalido(FHorario.Inicio)) or (FProximaMarcacao = thFimIntervalo)) then
    AbortarMarcacaoPontoForaDaSequencia(thAlmoco);

  if (TfrmHorario.HorarioInformadoValido(pTipoHorario, pTipoHorario.GetHorario(FHorario), lHorario, FHorario)) then
    FHorario.Almoco := lHorario;
end;

procedure TfrmPrincipal.AtualizarHorarioInicioCasoValido(const pTipoHorario: TTipoHorario);
var
  lHorario: string;
begin
  if (TfrmHorario.HorarioInformadoValido(pTipoHorario, pTipoHorario.GetHorario(FHorario), lHorario, FHorario)) then
    FHorario.Inicio := lHorario;
end;


procedure TfrmPrincipal.AtualizarProximaMarcacao(const pProximaMarcacao: TTipoHorario);
begin
  if (pProximaMarcacao = thNenhum) then
  begin
    FProximaMarcacao := FHorario.ProximaMarcacao();
    Exit;
  end;

  FProximaMarcacao := pProximaMarcacao;
end;

procedure TfrmPrincipal.MinimizarTela();
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  tiPrincipal.Visible := True;
end;

procedure TfrmPrincipal.btnExportarClick(Sender: TObject);
var
  ExcApp: OleVariant;
  i,l: integer;
begin
//  ExcApp := CreateOleObject('scalc.Application');
//  ExcApp.Visible := True;
//  ExcApp.WorkBooks.Add;
//  grdRelatorio.DataSource.DataSet.First;
//  l := 1;
//  grdRelatorio.DataSource.DataSet.First;
//  while not grdRelatorio.DataSource.DataSet.EOF do
//  begin
//    for i := 0 to grdRelatorio.DataSource.DataSet.Fields.Count - 1 do
//      ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
//        grdRelatorio.DataSource.DataSet.Fields[i].DisplayText;
//    grdRelatorio.DataSource.DataSet.Next;
//    l := l + 1;
//  end;
//  ExcApp.WorkBooks[1].SaveAs('C:\DSN\Horarios.xls');
end;
//var
//  linha, coluna : integer;
//  planilha : variant;
//  valorcampo : string;
//begin
//
//  planilha:= CreateoleObject('Excel.Application');
//  planilha.WorkBooks.add(1);
//  planilha.caption := 'Exportando dados do dbGrid, dataset ou query para o Excel';
//  planilha.visible := true;
//
//  grdRelatorio.DataSource.DataSet.First;
//  for linha := 0 to grdRelatorio.DataSource.DataSet.RecordCount - 1 do
//  begin
//    for coluna := 1 to grdRelatorio.DataSource.DataSet.FieldCount do
//    begin
//      valorcampo := grdRelatorio.DataSource.DataSet.Fields[coluna - 1].AsString;
//      planilha.cells[linha + 2,coluna] := valorCampo;
//    end;
//    grdRelatorio.DataSource.DataSet.Next;
//  end;
//
//  for coluna := 1 to grdRelatorio.DataSource.DataSet.FieldCount do
//  begin
//    valorcampo := grdRelatorio.DataSource.DataSet.Fields[coluna - 1].DisplayLabel;
//    planilha.cells[1,coluna] := valorcampo;
//  end;
//  planilha.columns.Autofit;
//
//  planilha.WorkBooks[1].SaveAs('C:\DSN\Horarios.xls');
//end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TfrmPrincipal.btnFiltrarRelatorioClick(Sender: TObject);
var
  lHoraExtra: TTime;
  lAtraso: TTime;
  lHoraEmTexto: string;
begin
  lHoraExtra := StrToTime('00:00:00');
  grdRelatorio.DataSource.DataSet := FHorario.Horarios(FiltroData);
  grdRelatorio.DataSource.DataSet.open;

  grdRelatorio.DataSource.DataSet.First;
  while (not grdRelatorio.DataSource.DataSet.Eof) do
  begin
    lHoraEmTexto := grdRelatorio.DataSource.DataSet.FieldByName('HoraExtra').AsString.Replace('--:--', '00:00');

    if (lHoraEmTexto = '') then
      lHoraEmTexto := '00:00';

    lHoraExtra := lHoraExtra + StrToTime(lHoraEmTexto);

    lHoraEmTexto := grdRelatorio.DataSource.DataSet.FieldByName('Atraso').AsString.Replace('--:--', '00:00');

    if (lHoraEmTexto = '') then
      lHoraEmTexto := '00:00';

    lAtraso := lAtraso + StrToTime(lHoraEmTexto);

    grdRelatorio.DataSource.DataSet.Next;
  end;

  if (lHoraExtra > lAtraso) then
    lblTipoSaldo.Caption := 'Extra'
  else
    if (lHoraExtra < lAtraso) then
      lblTipoSaldo.Caption := 'Atraso'
    else
      lblTipoSaldo.Caption := '---';

  lblValorSaldo.Caption := TimeToStr(lHoraExtra - lAtraso);
end;

function TfrmPrincipal.FiltroData: string;
begin
  Result := QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicialRelatorio.DateTime)) + ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtFinalRelatorio.DateTime));
end;

procedure TfrmPrincipal.btnMinimizarClick(Sender: TObject);
begin
  Application.Minimize();
end;

procedure TfrmPrincipal.mniEditarHorarioClick(Sender: TObject);
var
  lHorario: string;
begin
  if (TfrmHorario.HorarioInformadoValido(
        FProximaMarcacao.Anterior(),
        FProximaMarcacao.Anterior().GetHorario(FHorario),
        lHorario)) then
    FProximaMarcacao.Anterior().SetHorario(FHorario, lHorario);
end;


procedure TfrmPrincipal.mniIniciarIntervaloClick(Sender: TObject);
begin
  FProximaMarcacao := thInicioIntervalo;
  ProcessarMarcacaoDePonto();
end;

procedure TfrmPrincipal.mniMarcarHorarioClick(Sender: TObject);
begin
  ProcessarMarcacaoDePonto();
end;

procedure TfrmPrincipal.ProcessarMarcacaoDePonto();
begin
  FHorario.ValidarHorario(FProximaMarcacao);

  if (Self.WindowState = wsNormal) then
    ProcessarMarcacaoDePontoPelaTela()
  else
    ProcessarMarcacaoDePontoPeloMenu();
end;

procedure TfrmPrincipal.ProcessarMarcacaoDePontoPelaTela();
begin
  FProximaMarcacao.SetHorario(FHorario);
  AtualizarProximaMarcacao();
  CarregarHorarios();
end;

procedure TfrmPrincipal.ProcessarMarcacaoDePontoPeloMenu();
begin
  if (FProximaMarcacao = thInicioIntervalo) then
  begin
    FHorario.SetInicioIntervalo(EmptyStr);
    MostrarNotificacao();
    FProximaMarcacao := thFimIntervalo;
    Exit;
  end;

  if (FProximaMarcacao = thFimIntervalo) then
  begin
    FHorario.SetFimIntervalo(EmptyStr);
    MostrarNotificacao();
    Exit;
  end;

  FProximaMarcacao.SetHorario(FHorario);
  MostrarNotificacao();
  FProximaMarcacao := FHorario.ProximaMarcacao();

  if (Self.WindowState <> wsMinimized) then
    CarregarHorarios();
end;

procedure TfrmPrincipal.MostrarNotificacao();
var
  lNotificacao : TNotification;
begin
  if ((SistemaOperacionalWindowsSete) or (tsMostrarNotificacao.State = tssOff)) then
    Exit;

  lNotificacao := ncNotificacao.CreateNotification();
  try
    lNotificacao.Name := 'Controle de ponto';
    lNotificacao.Title := 'Marcado o ' + ASPAS_DUPLAS + FProximaMarcacao.ToString + ASPAS_DUPLAS + ' com sucesso.';
    lNotificacao.AlertBody := 'Às ' + ASPAS_DUPLAS + FProximaMarcacao.GetHorario(FHorario) + ASPAS_DUPLAS;
    ncNotificacao.PresentNotification(lNotificacao);
  finally
    lNotificacao.Free();
  end;
end;

procedure TfrmPrincipal.OnClickRemoverIntervalo(Sender: TObject);
begin
  if ((FHorario.Intervalo.Count = 0) or (HorarioInvalido(FHorario.Intervalo[TButton(Sender).Tag].InicioIntervalo))) then
    Exit;

  if (not TfrmMensagem.Confirma('Confirma remover o intervalo?', 'Remover intervalo')) then
    Exit;

  FHorario.RemoverIntervalo(TButton(Sender).Tag);
  AtualizarProximaMarcacao();
  CarregarHorarios();
  PrepararQuadroIntervalo();
end;

procedure TfrmPrincipal.CriarPainelIntervalo(
  const pTextoInicioIntervalo: string;
  const pTextoFimIntervalo: string;
  const pTotalIntervalo: string);
var
  lNomePainelIntervalo: string;
begin
  lNomePainelIntervalo := 'pnlIntervalo_' + IntToStr(FLinhaIntervalo);

  CriarPainel(
    sbIntervalo,
    lNomePainelIntervalo,
     alTop,
     40);

  CriarBotaoExcluirIntervalo(lNomePainelIntervalo);

  CriarLabelIntervalo(
    lNomePainelIntervalo,
    'lblTempoIntervalo_' + FLinhaIntervalo.ToString,
    pTotalIntervalo,
    alRight,
    147);

  CriarLabelIntervalo(
    lNomePainelIntervalo,
    'lblFimIntervalo_' + FLinhaIntervalo.ToString,
    pTextoFimIntervalo,
    alClient,
    0);

  CriarLabelIntervalo(
    lNomePainelIntervalo,
    'lblInicioIntervalo_' + FLinhaIntervalo.ToString,
    pTextoInicioIntervalo,
    alLeft,
    96);

  Inc(FLinhaIntervalo);
end;

procedure TfrmPrincipal.CriarLabelIntervalo(
  const pNomeParent: string;
  const pNomeComponente: string;
  const pTextoComponente: string;
  const pAlinhamento: TAlign;
  const pTamanho: integer);
var
  lLabel: TLabel;
begin
  lLabel := TLabel.Create(Self);
  lLabel.Parent := TPanel(FindComponent(pNomeParent));
  lLabel.Caption := pTextoComponente;
  lLabel.Name := pNomeComponente;
  lLabel.Align := pAlinhamento;
  lLabel.Alignment := taCenter;
  lLabel.Layout := tlCenter;
  lLabel.AutoSize := False;
  lLabel.Width := pTamanho;
  lLabel.DragCursor := crHandPoint;
  lLabel.Font.Size := 15;
  lLabel.Tag := FLinhaIntervalo;

  if (pNomeComponente.IndexOf('Inicio') > 0) then
    lLabel.OnClick := OnClickEditarInicioIntervalo;

  if (pNomeComponente.IndexOf('Fim') > 0) then
    lLabel.OnClick := OnClickEditarFimIntervalo;

  if (pNomeComponente.IndexOf('Tempo') <> 3) then
  begin
    lLabel.Hint := 'Clique aqui para editar.';
    lLabel.ShowHint := True;
    lLabel.Cursor := crHandPoint;
  end;

  lLabel.Left := 0;
end;

procedure TfrmPrincipal.CriarPainel(
  const pPainelParent: TWinControl;
  const pNomePainel: string;
  const pAlinhamento: TAlign;
  const pHeight: Integer);
var
  lPanel: TPanel;
begin
  lPanel := TPanel.Create(self);
  lPanel.Parent := pPainelParent;
  lPanel.Name := pNomePainel;
  lPanel.Caption := '';
  lPanel.Padding.Top := 5;
  lPanel.Padding.Bottom := 5;
  lPanel.Height := pHeight;
  lPanel.BevelOuter := bvNone;
  lPanel.Width := pPainelParent.Width;
  lPanel.Color := $00211B1C;
end;

procedure TfrmPrincipal.CriarBotaoExcluirIntervalo(const pNomeParent: string);
var
  lButton: TSpeedButton;
begin
  lButton := TSpeedButton.Create(Self);
  lButton.Parent := TPanel(FindComponent(pNomeParent));
  lButton.Name := 'btnRemoverIntervalo_' + FLinhaIntervalo.ToString();
  lButton.Caption := 'X';
  lButton.Flat := True;
  lButton.Font.Color := clWhite;
  lButton.Width := 35;
  lButton.Left := 0;
  lButton.Align := alRight;
  lButton.Tag := FLinhaIntervalo;
  lButton.OnClick := OnClickRemoverIntervalo;
end;

procedure TfrmPrincipal.OnClickEditarInicioIntervalo(Sender: TObject);
begin
  if (FHorario.Intervalo.Count <> 0) then
    AtualizarProximaMarcacao(thInicioIntervalo);

  FIndiceIntervalo := TLabel(Sender).Tag;
  EditarHorarioManual(thInicioIntervalo);

  if (HorarioValido(FHorario.Intervalo[FIndiceIntervalo].FimIntervalo)) then
    AtualizarProximaMarcacao();
end;

procedure TfrmPrincipal.OnClickEditarFimIntervalo(Sender: TObject);
begin
  if (FHorario.Intervalo.Count <> 0) then
    AtualizarProximaMarcacao(thFimIntervalo);

  FIndiceIntervalo := TLabel(Sender).Tag;
  EditarHorarioManual(thFimIntervalo);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if (SistemaOperacionalWindowsSete()) then
    tiPrincipal.IconIndex := 8
  else
    tiPrincipal.IconIndex := 9;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FHorario.Free();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  // carregar configurações
  CarregarHorarios();
  AtualizarData();
  IrParaPagina(tsHome);
 // AjustarTamanhoTela();
  PrepararQuadroIntervalo();
  pnlSetaIntervalo.Width := 130;
end;

procedure TfrmPrincipal.AjustarTamanhoTela();
begin
  frmPrincipal.Left := Screen.WorkAreaLeft;
  frmPrincipal.Width := Screen.WorkAreaWidth;
  frmPrincipal.Height := Screen.WorkAreaHeight;
end;

procedure TfrmPrincipal.AtualizarData();
begin
  lblData.Caption := FormatDateTime('dd/mm/yyyy', Date());
end;


procedure TfrmPrincipal.CarregarHorarios();
begin
  frmeHoraInicio.lblHora.Caption := FHorario.Inicio;
  frmeHoraAlmoco.lblHora.Caption := FHorario.Almoco;
  frmeHoraRetorno.lblHora.Caption := FHorario.Retorno;
  frmeHoraFim.lblHora.Caption := FHorario.Fim;
  TratarQuadroFimExpediente();

  lblHoraPeriodoManha.Caption := FHorario.PeriodoManha();
  lblHoraPeriodoAlmoco.Caption := FHorario.PeriodoAlmoco();
  lblHoraPeriodoTarde.Caption := FHorario.PeriodoTarde();

  lblHoraCargaHoraria.Caption := FHorario.CargaHoraria();
  lblHoraHoraExtra.Caption := FHorario.HoraExtra();
  lblHoraAtraso.Caption := FHorario.Atraso();

  if (HorarioValido(FHorario.TotalIntervalos)) then
    lblHoraIntervalo.Caption := FHorario.TotalIntervalos()
  else
    lblHoraIntervalo.Caption := HORARIO_EM_BRANCO;

end;

procedure TfrmPrincipal.TratarQuadroFimExpediente();
const
  PREVISAO_SAIDA_SEM_MARCAR_RETORNO = 'Retornando agora as %s a previsão de saída será as %s.';
  PREVISAO_SAIDA_COM_RETORNO_MARCADO = 'Previsão de saída para as %s.';
var
  lTituloFimExpediente: string;
begin
  lblPrevisaoSaida.Visible := (FProximaMarcacao in [thRetorno, thFim]);

  if (FProximaMarcacao = thRetorno) then
    lTituloFimExpediente := Format(PREVISAO_SAIDA_SEM_MARCAR_RETORNO, [FHorario.RetornoSimulado(), FHorario.PrevisaoTerminoExpediente])
  else
    lTituloFimExpediente := Format(PREVISAO_SAIDA_COM_RETORNO_MARCADO, [FHorario.PrevisaoTerminoExpediente]);

  lblPrevisaoSaida.Caption := lTituloFimExpediente;
end;


procedure TfrmPrincipal.frmeHoraAlmocoimg1Click(Sender: TObject);
begin
  if (FProximaMarcacao = thNenhum) then
    TfrmMensagem.ExibirMensagem('Foi marcado o fim de expediente.' + sLineBreak + 'Para marcar almoço será necessário retirar o fim do expediente.');

  EditarHorarioManual(thAlmoco);
end;

procedure TfrmPrincipal.frmeHoraAlmocoimgAdicionarHorarioClick(Sender: TObject);
begin
  if (FProximaMarcacao = thNenhum) then
    TfrmMensagem.ExibirMensagem('Foi marcado o fim de expediente.' + sLineBreak + 'Para marcar almoço será necessário retirar o fim do expediente.');

  if (HorarioValido(frmeHoraInicio.lblHora.Caption) and (HorarioInvalido(frmeHoraAlmoco.lblHora.Caption))) then
  begin
    AtualizarProximaMarcacao(thAlmoco);
    ProcessarMarcacaoDePonto();
  end;
end;

procedure TfrmPrincipal.frmeHoraAlmocoimgRemoverHorarioClick(Sender: TObject);
begin
  RemoverMarcacaoDoPontoCasoConfirmado(thRetorno);

  if (HorarioValido(FHorario.Retorno)) then
    if (not TfrmMensagem.Confirma('Removendo a marcação de almoco, as demais também serão retiradas.' + sLineBreak +'Confirma a remoção?', 'Remover marcação')) then
      Exit;

  AtualizarProximaMarcacao(thAlmoco);
  FHorario.LimparAlmocoEmDiante();
  CarregarHorarios();
end;

procedure TfrmPrincipal.RemoverMarcacaoDoPontoCasoConfirmado(const pTipoHorario: TTipoHorario);
begin
  if (HorarioInvalido(pTipoHorario.GetHorario(FHorario))) then
    if (not TfrmMensagem.Confirma('Confirma remover a marcação do ponto?', 'Remover marcação')) then
      Abort;
end;

procedure TfrmPrincipal.frmeHoraFimImage1Click(Sender: TObject);
begin
  if (not TfrmMensagem.Confirma('Confirma retirar a marcação de fim de expediente?', 'Remover marcação')) then
    Exit;

  AtualizarProximaMarcacao(thFim);
  FHorario.Fim := HORARIO_EM_BRANCO;
  CarregarHorarios();

  TratarQuadroFimExpediente();
end;

procedure TfrmPrincipal.frmeHoraFimimg1Click(Sender: TObject);
begin
  EditarHorarioManual(thFim);
end;

procedure TfrmPrincipal.frmeHoraFimimgAdicionarHorarioClick(Sender: TObject);
const
  FIM_EXPEDIENTE = 'Fim do expediente';
  CONFIRMA_FIM_EXPEDIENTE = 'Não foi informado o intervalo de almoço. Confirma marcar o fim do expediente?';
begin
  if ((HorarioInvalido(FHorario.Almoco)) and (HorarioInvalido(FHorario.Retorno)) and
      (TfrmMensagem.Confirma(CONFIRMA_FIM_EXPEDIENTE, FIM_EXPEDIENTE))) then
  begin
    AtualizarProximaMarcacao(thFim);
    ProcessarMarcacaoDePonto();
  end;

  if (HorarioValido(frmeHoraRetorno.lblHora.Caption) and (HorarioInvalido(frmeHoraFim.lblHora.Caption))) then
  begin
    AtualizarProximaMarcacao(thFim);
    ProcessarMarcacaoDePonto();
  end;
end;

procedure TfrmPrincipal.frmeHoraInicioImage1Click(Sender: TObject);
begin
  RemoverMarcacaoDoPontoCasoConfirmado(thAlmoco);

  if (HorarioValido(FHorario.Almoco)) then
    if (not TfrmMensagem.Confirma('Removendo a marcação de início de expediente, as demais também serão retiradas.' + sLineBreak +'Confirma a remoção?', 'Remover marcação')) then
      Exit;

  AtualizarProximaMarcacao(thInicio);
  FHorario.LimparTodos();
  CarregarHorarios();
end;

procedure TfrmPrincipal.frmeHoraInicioimgAddHorarioClick(Sender: TObject);
begin
  if (HorarioInvalido(frmeHoraInicio.lblHora.Caption)) then
  begin
    AtualizarProximaMarcacao(thInicio);
    ProcessarMarcacaoDePonto();
  end;
end;

procedure TfrmPrincipal.frmeHoraRetornoimg1Click(Sender: TObject);
begin
  if (FProximaMarcacao = thNenhum) then
    TfrmMensagem.ExibirMensagem('Foi marcado o fim de expediente.' + sLineBreak + 'Para marcar retorno do almoço será necessário retirar o fim do expediente.');

  EditarHorarioManual(thRetorno);
end;

procedure TfrmPrincipal.frmeHoraRetornoimgAdicionarHorarioClick(Sender: TObject);
begin
  if (FProximaMarcacao = thNenhum) then
    TfrmMensagem.ExibirMensagem('Foi marcado o fim de expediente.' + sLineBreak + 'Para marcar almoço será necessário retirar o fim do expediente.');

  if (HorarioValido(frmeHoraAlmoco.lblHora.Caption) and (HorarioInvalido(frmeHoraRetorno.lblHora.Caption))) then
  begin
    AtualizarProximaMarcacao(thRetorno);
    ProcessarMarcacaoDePonto();
  end;
end;

procedure TfrmPrincipal.frmeHoraRetornoimgRemoverHorarioClick(Sender: TObject);
begin
  RemoverMarcacaoDoPontoCasoConfirmado(thFim);

  if (HorarioValido(FHorario.Fim)) then
    if (not TfrmMensagem.Confirma('Removendo a marcação de retorno do almoço, a marcação de fim de expediente também será retirado.' + sLineBreak +'Confirma a remoção?', 'Remover marcação')) then
      Exit;

  AtualizarProximaMarcacao(thRetorno);
  FHorario.LimparRetornoEmDiante();
  CarregarHorarios();
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
  if (svMenuPrincipal.Opened) then
    svMenuPrincipal.Close()
  else
    svMenuPrincipal.Open();
end;

procedure TfrmPrincipal.PrepararQuadroIntervalo();
begin
  if (pnlIntervalos.Height = 40) then
    Exit;

  DestruirComponentes(sbIntervalo);
  FLinhaIntervalo := 0;

  if (FHorario.Intervalo.Count = 0) then
  begin
    CriarPainelIntervalo();
    OrdenarComponente(sbIntervalo);
    Exit;
  end;

  PreencherQuadroIntervalo();
  OrdenarComponente(sbIntervalo);
end;

procedure TfrmPrincipal.PreencherQuadroIntervalo();
var
  lIntervalo: TIntervalo;
begin
  for lIntervalo in FHorario.Intervalo do
    CriarPainelIntervalo(lIntervalo.InicioIntervalo, lIntervalo.FimIntervalo, lIntervalo.TotalIntervalo);
end;

procedure TfrmPrincipal.IrParaPagina(const pPagina: TTabSheet);
var
  I: Integer;
begin
  for I:= 0 to pgcPrincipal.PageCount -1 do
    pgcPrincipal.Pages[I].TabVisible := False;

  pgcPrincipal.ActivePage := pPagina;
end;

procedure TfrmPrincipal.lblIntervalosClick(Sender: TObject);
begin
  ToggleIntervalo();
end;

procedure TfrmPrincipal.lblIntervalosMouseEnter(Sender: TObject);
begin
  MostrarBorda(pnlSetaIntervalo);
end;

procedure TfrmPrincipal.lblIntervalosMouseLeave(Sender: TObject);
begin
  MostrarBorda(pnlSetaIntervalo, False);
end;

procedure TfrmPrincipal.ToggleIntervalo();
begin
  pnlImgSetaCima.Visible := (not pnlImgSetaCima.Visible);
  pnlImgSetaBaixo.Visible := (not pnlImgSetaBaixo.Visible);

  if (pnlIntervalos.height = 40) then
    begin
      pnlDados.Align := alBottom;
      pnlIntervalos.Align := alClient;
    end
  else
    begin
      pnlIntervalos.Align := alTop;
      pnlDados.Align := alTop;
      pnlIntervalos.Height := 40;
    end;

  PrepararQuadroIntervalo();
end;

procedure TfrmPrincipal.pmPrincipalPopup(Sender: TObject);
begin
  FProximaMarcacao := FHorario.ProximaMarcacao();

  {0 - Abrir
   1 - Marcar
   2 - Editar
   3 - Intervalo
   4 - Sair}

  pmPrincipal.Items[1].Enabled := (FProximaMarcacao <> thNenhum);
  pmPrincipal.Items[2].Enabled := (FProximaMarcacao <> thInicio);
  pmPrincipal.Items[3].Enabled := (not (FProximaMarcacao in [thNenhum, thInicio, thRetorno, thFimIntervalo]));

  pmPrincipal.Items[1].Caption := TituloMarcarPonto();
  pmPrincipal.Items[2].Caption := TituloEditarPonto();
end;

function TfrmPrincipal.TituloMarcarPonto(): string;
const
  INICIAR_EXPEDIENTE = 'Iniciar expediente';
  ALMOCO = 'Almoço';
  RETORNO = 'Retorno (previsão de fim de expediente às ';
  ENCERRAR_EXPEDIENTE = 'Encerrar expediente (Previsto para às ';
  FIM_INTERVALO = 'Finalizar intervalo';
var
  lPrevisaoSaída: string;
begin
  if (FProximaMarcacao in [thRetorno, thFim]) then
    lPrevisaoSaída := ASPAS_DUPLAS + FHorario.PrevisaoTerminoExpediente() + ASPAS_DUPLAS + ')';

  case FProximaMarcacao of
    thInicio: Result := INICIAR_EXPEDIENTE;
    thAlmoco: Result := ALMOCO;
    thRetorno: Result := RETORNO + lPrevisaoSaída;
    thFim: Result := ENCERRAR_EXPEDIENTE + lPrevisaoSaída;
    thFimIntervalo: Result := FIM_INTERVALO;
  else
    Result := INICIAR_EXPEDIENTE;
  end;
end;

function TfrmPrincipal.TituloEditarPonto(): string;
begin
  if (FProximaMarcacao = thInicio) then
    Exit('Editar');

  Result := 'Editar ' + ASPAS_DUPLAS + FProximaMarcacao.Anterior().ToString() + ': ' + FProximaMarcacao.Anterior().GetHorario(FHorario) + ASPAS_DUPLAS;
end;

//procedure TfrmPrincipal.EditarHorarioManual(const pTipoHorario: TTipoHorario);
//const
//  MENSAGEM_MARCACAO =  'Antes de registrar o ' + ASPAS_DUPLAS + '%s' + ASPAS_DUPLAS + ' deverá registrar o '+ ASPAS_DUPLAS + '%s' + ASPAS_DUPLAS +'.';
//var
//  lHorario: string;
//begin
//
//
//  if pTipoHorario in [thInicioIntervalo, thFimIntervalo] then
//  begin
//    if (FProximaMarcacao in [thNenhum, thInicio, thRetorno, thFimIntervalo]) then
//      TfrmMensagem.ExibirMensagem(Format(MENSAGEM_MARCACAO, [pTipoHorario.ToString, FProximaMarcacao.ToString]));
//
//    AtualizarProximaMarcacao(pTipoHorario);
//
//    lHorario := EmptyStr;
//
//    if FHorario.Intervalo.Count > 0 then
//      if pTipoHorario = thinicioIntervalo then
//        lHorario := FHorario.Intervalo[FHorario.Intervalo.Count-1].InicioIntervalo
//      else
//        lHorario := FHorario.Intervalo[FHorario.Intervalo.Count-1].FimIntervalo;
//
//    lHorario := TfrmHorario.Exibir(FProximaMarcacao, lHorario);
//
//    if (HorarioValido(lHorario)) then
//    begin
//      if (pTipoHorario = thInicioIntervalo) then
//        begin
//          FHorario.SetInicioIntervalo(lHorario);
//          AtualizarProximaMarcacao(thFimIntervalo);
//          PrepararQuadroIntervalo();
//        end
//      else
//        begin
//          FHorario.SetFimIntervalo(lHorario);
//          PrepararQuadroIntervalo();
//          CriarPainelIntervalo();
//          OrdenarComponente(sbIntervalo);
//        end;
//
//      //PrepararQuadroIntervalo();
//    end;
//
//    Exit;
//  end;
//
//
//  if ((FProximaMarcacao <> pTipoHorario) and (HorarioInvalido(FProximaMarcacao.GetHorario(FHorario)))) then
//    TfrmMensagem.ExibirMensagem(Format(MENSAGEM_MARCACAO, [pTipoHorario.ToString, FProximaMarcacao.ToString]));
//
//  AtualizarProximaMarcacao(pTipoHorario);
//  AtualizarMarcacaoComHorarioValido();
//end;


procedure TfrmPrincipal.EditarHorarioManual(const pTipoHorario: TTipoHorario);
begin
  case pTipoHorario of
    thInicio: AtualizarHorarioInicioCasoValido(pTipoHorario);
    thAlmoco: AtualizarHorarioAlmocoCasoValido(pTipoHorario);
    thRetorno: AtualizarHorarioRetornoCasoValido(pTipoHorario);
    thFim: AtualizarHorarioFimExpedienteCasoValido(pTipoHorario);
    thInicioIntervalo: AtualizarHorarioInicioIntervaloCasoValido(pTipoHorario);
    thFimIntervalo: AtualizarHorarioFimIntervaloCasoValido(pTipoHorario);
  end;

  AtualizarProximaMarcacao();
  CarregarHorarios();
end;

procedure TfrmPrincipal.MarcarFimDeExpedienteCasoConfirmado();
const
  FIM_EXPEDIENTE = 'Fim do expediente';
  CONFIRMA_FIM_EXPEDIENTE = 'Não foi informado o intervalo de almoço. Confirma marcar o fim do expediente?';
var
  lHorario: string;
begin
  if ((TfrmMensagem.Confirma(CONFIRMA_FIM_EXPEDIENTE, FIM_EXPEDIENTE)) and
      (TfrmHorario.HorarioInformadoValido(thFim, '', lHorario, FHorario))) then
    FHorario.Fim := lHorario;

  AtualizarProximaMarcacao(thNenhum);
  CarregarHorarios();
  Abort();
end;

procedure TfrmPrincipal.AbortarMarcacaoPontoForaDaSequencia(const pTipoHorario: TTipoHorario);
const
  MENSAGEM_MARCACAO =
    'Antes de registrar o ' + ASPAS_DUPLAS + '%s' + ASPAS_DUPLAS + ' deverá registrar o '+ ASPAS_DUPLAS + '%s' + ASPAS_DUPLAS +'.';
var
  lProximaMarcacao: string;
begin
  lProximaMarcacao := FProximaMarcacao.ToString;

  if (pTipoHorario = thFimIntervalo) then
   lProximaMarcacao := thInicioIntervalo.ToString();

  TfrmMensagem.ExibirMensagem(Format(MENSAGEM_MARCACAO, [pTipoHorario.ToString, lProximaMarcacao]));
end;

procedure TfrmPrincipal.ValidarFimDeExpediente();
const
  MENSAGEM_FIM_EXPEDIENTE =
    'O expediente foi encerrado e não será possível lançar tempo de intervalo. ' + sLineBreak +
    'Para lançar intervalo, será necessário excluir o registro de fim de expediente.';
begin
  if (FProximaMarcacao = thNenhum) then
    TfrmMensagem.ExibirMensagem(MENSAGEM_FIM_EXPEDIENTE);
end;

procedure TfrmPrincipal.QuadroHorario1img1Click(Sender: TObject);
begin
  EditarHorarioManual(thInicio);
end;

procedure TfrmPrincipal.mniSairDoAppClick(Sender: TObject);
begin
   Application.Terminate();
end;

procedure TfrmPrincipal.tiPrincipalDblClick(Sender: TObject);
begin
  AbrirTela();
end;

procedure TfrmPrincipal.mniAbrirTelaClick(Sender: TObject);
begin
  AbrirTela();
end;

procedure TfrmPrincipal.mniCalcularintervaloClick(Sender: TObject);
begin
  TfrmCalculoIntervalo.AbrirTela;
end;

procedure TfrmPrincipal.AbrirTela();
begin
  tiPrincipal.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;



end.
