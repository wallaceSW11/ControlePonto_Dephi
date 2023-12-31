object QuadroHorario: TQuadroHorario
  Left = 0
  Top = 0
  Width = 210
  Height = 160
  Anchors = []
  Constraints.MaxHeight = 160
  Constraints.MaxWidth = 210
  Constraints.MinHeight = 160
  Constraints.MinWidth = 210
  TabOrder = 0
  object pnlIntervaloAlmoco: TPanel
    Left = 0
    Top = 0
    Width = 210
    Height = 160
    Align = alClient
    BevelOuter = bvNone
    Color = 3156265
    ParentBackground = False
    TabOrder = 0
    object pnlLateral1: TPanel
      Left = 0
      Top = 0
      Width = 3
      Height = 160
      Align = alLeft
      BevelOuter = bvNone
      Color = 6050384
      ParentBackground = False
      TabOrder = 0
    end
    object pnlHoraInicio: TPanel
      Left = 3
      Top = 0
      Width = 207
      Height = 160
      Align = alClient
      BevelOuter = bvNone
      Color = 3156265
      Padding.Left = 7
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 1
      object lblTitulo: TLabel
        Left = 7
        Top = 10
        Width = 190
        Height = 24
        Align = alTop
        Alignment = taCenter
        Caption = 'Inicio de expediente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 174
      end
      object lblHora: TLabel
        Left = 7
        Top = 34
        Width = 190
        Height = 91
        Align = alClient
        Alignment = taCenter
        Caption = '--:--'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 55
        ExplicitHeight = 33
      end
      object pnl21: TPanel
        Left = 7
        Top = 125
        Width = 190
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 3156265
        ParentBackground = False
        TabOrder = 0
        object pnlRemoverHorario: TPanel
          Left = 167
          Top = 0
          Width = 23
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Color = 3156265
          ParentBackground = False
          TabOrder = 0
          object imgRemoverHorario: TImage
            Left = 0
            Top = 0
            Width = 23
            Height = 25
            Hint = 'Remover hor'#225'rio'
            Align = alClient
            ParentShowHint = False
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000600000
              006008040000004891BFB3000004B14944415478DAED9B5D68544714C7FFA7B4
              4904B1B1498C1F90C68A0A1A63147D6A49A8D6E441AD5A1544D134ADA20FA646
              31600BADD4425B303449E3438AB67E044B41DBC6AF87C42F0CFAA4A849B4A062
              920A56ADA91A0998B4A5E3F4B286CCDCD9BD7777EFEECD5976967DF9DF3B33E7
              3777EE9933736708CC13F96D4012C06F0392007E1B9004F0DB8021062032300B
              933051FE73300CA91823C57BE8C733DCC14DDC92FF4BF4D710041069780773E4
              6FBA8B9B5B7146FE4E51DF10011045588DE5181166B6A73884063AE72B804841
              192A31218A226E6327F6D2DF3E00C84EB3411A3F369A0608A43F24447DA41D2A
              4200311FDFE20D0F8C7F913AF0119D881380C8412D167B68FC8BD4884D7427E6
              006211F6213D06E6FF9F9EE07D3A124300F18AECAD9B1C6EEA460BAEE337E9F1
              1FA18FEECB5CA39186D7E4C830055351884C87FCB5A8A47F62022046E228DE0A
              71C365FC84266A7328251F25588199216E398F77E9B1E700621C9A640B9A532F
              76E307BA164663E4E103ACC3F02097AFA384EE7A0A2026A119AF1B2FF5A00E35
              91840732ECA840395E355EFC1DC574D33300D9FA178298DF80ADF467F8C60F94
              3C0A55721C3723BCE9E629B800907DBF0579860B5DD267441D0A58A1C83EE41A
              2E5C43A1F3BBE00820C385D3C657B71165F4247AF3AD3AD2B1D738B29CC75CA7
              30C319A0C6E038053EA1AFBD317EA0C86DF8D2604D2D5544052016E317DB3DFF
              622DEDF7D67CABAE52ECC1CBB6A67A8F1A23069041C3558CB499BF2CDCD1D235
              C2221CB6213C4641A8002334C0AFB69E2964CF8F41EB0F145F2ADF06DDA6465A
              1211808C388FDBC48FBDEEFBB65AB7E12B9BB82078A41A14400C936E4C0F9843
              B6856708F6E7DE813C7A162E4005AA35A90B33BC729C2101D271C5362E6CA69A
              B00044AA9CEC8D5325BCEDC5B0E50AA1086735CBEE6202F58703B01EF59AD440
              6BE263BE55FF015B80B181BE730D2008B7B4A97A0F26D383380264E38616E6DD
              C644126E010AA177962FE8B3F8996FD9B0039F6A5211B5B805D8830F15A117B9
              DEAEA7B900C8904E439D2F7C4F6B5D0148077A4F7B7CD5B425BEE65B767C83CD
              8AD0833176676A025880639A342D9CD99667007968D7A485641B5A4D003AF915
              0A35838D25C265CC5004434F30015CD596682BA9CA2780ADD8A908AD54E00820
              32F1002F29D274A795869801E4A35511FE4336753B01CC93D3F7C1E9A1CC64F0
              BF710120D998598A544C279D0036A24E117EA665FE986F5973184B15A19C7639
              01D461A322ECA0ED3E027C0E7500DD45E54E00CD98A708ABE8471F0156E2A022
              9CA4622780364C5384D974C958B4C7EF0599638259B8A808ED94EF04D0A9C5E2
              E3A9CB47805C742A42178D770278A8AD1F679AA3A038016440759BDD94A5E5B3
              65E943AA22A49A9796E2049002751AD34F69090FC0BE0BB17F89D9BB51F60319
              FB50827D30C73E9CE63EA1613FA54C84493DFB6515EE0B5BEC971613617197FB
              F23AFB0F1C09F08989FD47BE04F8CCCAFE437790B6E0B4D52001367BB0DF6E63
              95C07BC353026C3963BFE9CFAA82F7B64BAB22DE1B5FADEA786F3DB62AE5BDF9
              DBAA9CF7F6FB0004E703100104DE475002109C0F010510781FC30A40703E0837
              0883EF51C441109C0F832A205C8FE3FA9792007EA72480DF2909E077620FF01C
              3491327FCE3EE1300000000049454E44AE426082}
            Proportional = True
            ShowHint = True
            OnMouseEnter = imgRemoverHorarioMouseEnter
            OnMouseLeave = imgRemoverHorarioMouseLeave
            ExplicitLeft = 56
            ExplicitTop = 7
            ExplicitWidth = 21
            ExplicitHeight = 22
          end
        end
        object pnlEditarHorario: TPanel
          Left = 139
          Top = 0
          Width = 25
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Color = 3156265
          ParentBackground = False
          TabOrder = 1
          object imgEditarHorario: TImage
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Editar hor'#225'rio'
            Align = alClient
            ParentShowHint = False
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
              002408040000004B095013000000F04944415478DAEDD63F0E01411805F0F71D
              40A3A152398068E8681C4023CE2151292894CEB2A1165740A3E3008ADD0B28D6
              2E9BCD37FB2FFB6669C4EB6632F9E59B37CD083E14F9432A7E1B633872AB08F9
              5DEC51878B919C2A40111326415190DFC4256252143BD1026BB574D1972B0905
              976AC93645CD654341AF6E6A988A63501E7AD44471C50F83F2828E8E4447EAA5
              3435D34C09C86034D590BB3E2724F3A62661ED66846612DD948018A600E2985C
              886572209EC9846C980CC88E4941B64C02B2670CA80AA320BF83833DA3A12556
              F64C3144304510C5E443249307D18C868618C4BB3B3973CC8FFC46BE0C3D01F3
              8E7B25BEDD20FD0000000049454E44AE426082}
            Proportional = True
            ShowHint = True
            OnMouseEnter = imgEditarHorarioMouseEnter
            OnMouseLeave = imgEditarHorarioMouseLeave
            ExplicitHeight = 24
          end
        end
        object pnl22: TPanel
          Left = 164
          Top = 0
          Width = 3
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 2
        end
        object pnlAddHorario: TPanel
          Left = 114
          Top = 0
          Width = 25
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Color = 3156265
          ParentBackground = False
          TabOrder = 3
          object imgAdicionarHorario: TImage
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Marcar hor'#225'rio atual'
            Align = alClient
            ParentShowHint = False
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
              00300804000000FD0B310C000002E54944415478DAED974D48545114C7FF0773
              9792B5A830825C8C164150504C8ED20C52411124388BC8895AB5E87351BB3EDD
              857D58ED2B0D210583082B709CA019A7025DD4222D5088A20FA8406995C3EDCC
              9D376F3EDEBDF7BD19155C7856E7BE7BDFF9DD77EEB9E79C475860A145011042
              F3B287B79700F303988B2C0E80A8C17E04B101B5588B0AFCC0577C421451FA36
              0F00711027D08C65CAC96174D2B3BC959BA9A3248068C435EC74D9C13B1CA7A4
              34FF0895E8A2331E01A202D771DA8B0391C20D8CA19BCDA7E5325DF100102B78
              3FBBF31E8CE209E2F88CEFACAFC17A047000DB94B008F5BA02D87C029BEC611F
              2ED047C52A1F3A10369B5702D83983F6EE277188DEE8BD2376A01775F6F018DD
              2B5EA102DCB27D1F431BFD321F8058857E0EE18C74D2395700474EDC36BF87FE
              15CC5929A33045884ABCB0102934D3881B206105E624B617EF5E0D905FF1D672
              D47B6C21610070340F6414F89DBED701E459242D5BFB68D004882224957E0A03
              DE013CD787B68C6329A40570CEF9299382408332304D001FC6A53581DAFC1C55
              08388C1EA98C91EA1219013C3B8AAD5269A7873AC00344A47289AE9601B8884C
              92B84F4775801876492544B1320041CEAE69794D7E1D601CF552A9579D802BC0
              8709A94C519D0E308D2AA954D34C19802A4C4BE52F2D5F58C00C552FAC8B26A8
              4107703964B3D887FC9282B9A72585A90B201BA6DD74440768E7C29716CD4573
              01642F5A847A748095DC92185285D17C3655CC6235FDD60078D9B095D995C9CE
              08F092ECDCD2B5C17C2E5DB7D2630380978E2073D11505476B3E57709254D447
              390101BCB25447C9D498CF954CA089E285B3AACCDE855336A2B4A27F9B1CAD9A
              BA6D798E166B504ADB3284BD94F20090952D818DF6D05BE3F5018DF4C7B94AD7
              3AD6B0D996BC076EADE310C22AF3E6E6F7264EC29BDCC159A7735C001212E0F6
              DD0FB32471BE38723C0324A4957F409A943F20B31CD07769C0FC7E69BF50EBD8
              FFE073F882290EE1A76AAF9701988B2C015CE53F96EC1140DAE3666D00000000
              49454E44AE426082}
            Proportional = True
            ShowHint = True
            OnMouseEnter = imgAdicionarHorarioMouseEnter
            OnMouseLeave = imgAdicionarHorarioMouseLeave
            ExplicitLeft = -6
          end
        end
      end
    end
  end
end
