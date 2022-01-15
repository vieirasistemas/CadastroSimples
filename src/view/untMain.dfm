object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro simples'
  ClientHeight = 305
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnovo: TBitBtn
    Left = 8
    Top = 8
    Width = 90
    Height = 24
    Hint = 'Adicionar Novo Registro'
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnovoClick
  end
  object pnlPrincipal: TPanel
    Left = 8
    Top = 38
    Width = 585
    Height = 259
    Align = alCustom
    Enabled = False
    TabOrder = 1
    object Label26: TLabel
      Left = 35
      Top = 17
      Width = 37
      Height = 16
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 227
      Top = 47
      Width = 35
      Height = 16
      Caption = 'C.P.F.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label45: TLabel
      Left = 53
      Top = 47
      Width = 19
      Height = 16
      Caption = 'RG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 412
      Top = 47
      Width = 47
      Height = 16
      Caption = 'Telefone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label43: TLabel
      Left = 35
      Top = 77
      Width = 37
      Height = 16
      Caption = 'E-mail'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 432
      Top = 77
      Width = 26
      Height = 16
      Caption = 'CEP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 8
      Top = 107
      Width = 64
      Height = 16
      Caption = 'Logradouro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 38
      Top = 166
      Width = 34
      Height = 16
      Caption = 'Bairro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 32
      Top = 196
      Width = 40
      Height = 16
      Caption = 'Cidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 471
      Top = 196
      Width = 41
      Height = 16
      Caption = 'Estado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 27
      Top = 136
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 131
      Top = 136
      Width = 80
      Height = 16
      Caption = 'Complemento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 46
      Top = 228
      Width = 26
      Height = 16
      Caption = 'Pa'#237's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ednome: TEdit
      Left = 81
      Top = 9
      Width = 488
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Nome'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = ednomeChange
    end
    object mecpf: TMaskEdit
      Left = 289
      Top = 39
      Width = 98
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'CPF'
      EditMask = '999.999.999-99;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
      Text = ''
      OnChange = mecpfChange
    end
    object edrg: TEdit
      Left = 81
      Top = 39
      Width = 131
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'RG'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edrgChange
    end
    object mefone1: TMaskEdit
      Left = 466
      Top = 39
      Width = 103
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Telefone'
      EditMask = '(99)#9999-9999;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 3
      Text = ''
      OnChange = mefone1Change
    end
    object Edemail: TEdit
      Left = 81
      Top = 69
      Width = 310
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'E-mail'
      CharCase = ecLowerCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = EdemailChange
    end
    object mecep: TMaskEdit
      Left = 464
      Top = 69
      Width = 81
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'CEP'
      EditMask = '99.999.999;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      Text = ''
      OnChange = mecepChange
      OnExit = mecepExit
    end
    object EdEndereco: TEdit
      Left = 81
      Top = 99
      Width = 488
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Endere'#231'o'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = EdEnderecoChange
    end
    object EdBairro: TEdit
      Left = 81
      Top = 158
      Width = 488
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Bairro'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnChange = EdBairroChange
    end
    object EdCidade: TEdit
      Left = 81
      Top = 188
      Width = 312
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Cidade'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnChange = EdCidadeChange
    end
    object ednr: TEdit
      Left = 81
      Top = 128
      Width = 48
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Numero'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnChange = ednrChange
    end
    object edcomplemento: TEdit
      Tag = 99
      Left = 217
      Top = 128
      Width = 352
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Complemento'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnChange = edcomplementoChange
    end
    object edestado: TEdit
      Left = 521
      Top = 188
      Width = 48
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Estado'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnChange = edestadoChange
    end
    object edpais: TEdit
      Left = 81
      Top = 220
      Width = 312
      Height = 24
      HelpType = htKeyword
      HelpKeyword = 'Pa'#237's'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnChange = edpaisChange
    end
    object btgravar: TBitBtn
      Left = 479
      Top = 221
      Width = 90
      Height = 24
      Hint = 'Gravar'
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = btgravarClick
    end
    object btbuscar: TBitBtn
      Left = 544
      Top = 69
      Width = 25
      Height = 24
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btbuscarClick
    end
  end
end
