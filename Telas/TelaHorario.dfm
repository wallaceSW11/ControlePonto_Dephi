object frmHorario: TfrmHorario
  Left = 0
  Top = 0
  Anchors = []
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmHorario'
  ClientHeight = 139
  ClientWidth = 271
  Color = 2169628
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlMainTop: TPanel
    Left = 0
    Top = 0
    Width = 271
    Height = 139
    Align = alClient
    BevelOuter = bvNone
    Color = 2169628
    ParentBackground = False
    TabOrder = 0
    object pnl4: TPanel
      Left = 0
      Top = 0
      Width = 271
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblTituloHorario: TLabel
        Left = 0
        Top = 0
        Width = 271
        Height = 49
        Align = alClient
        Alignment = taCenter
        Caption = 'Fim de expediente'
        Color = 2169628
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Roboto'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 159
        ExplicitHeight = 24
      end
    end
    object pnl5: TPanel
      Left = 0
      Top = 49
      Width = 271
      Height = 90
      Align = alClient
      BevelOuter = bvNone
      Color = 2169628
      ParentBackground = False
      TabOrder = 1
      object pnl1: TPanel
        Left = 0
        Top = 45
        Width = 271
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        Color = 2169628
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          271
          45)
        object pnl2: TPanel
          Left = 49
          Top = 8
          Width = 175
          Height = 26
          Anchors = []
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            175
            26)
          object Panel1: TPanel
            Left = 92
            Top = 0
            Width = 83
            Height = 26
            Anchors = []
            BevelOuter = bvNone
            Caption = 'Cancelar'
            Color = 6050384
            ParentBackground = False
            TabOrder = 1
            OnClick = Panel1Click
          end
          object pnl3: TPanel
            Left = 0
            Top = 0
            Width = 83
            Height = 26
            Anchors = []
            BevelOuter = bvNone
            Color = 6050384
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              83
              26)
            object btnCancelar: TBitBtn
              Left = 0
              Top = 0
              Width = 83
              Height = 26
              Anchors = []
              Caption = 'OK'
              Default = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Roboto'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = btnOkClick
            end
          end
        end
      end
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 271
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = 2169628
        Padding.Left = 45
        Padding.Top = 5
        Padding.Right = 45
        ParentBackground = False
        TabOrder = 1
        object edtHora: TEdit
          Left = 45
          Top = 5
          Width = 181
          Height = 32
          Align = alTop
          Alignment = taCenter
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 2169628
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Roboto'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 0
          OnExit = edtHoraExit
          OnKeyPress = edtHoraKeyPress
          OnKeyUp = edtHoraKeyUp
        end
        object pnl12: TPanel
          Left = 45
          Top = 38
          Width = 181
          Height = 3
          Align = alBottom
          BevelOuter = bvNone
          Color = 6050384
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
  end
end
