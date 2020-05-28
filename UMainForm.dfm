object MainForm: TMainForm
  Left = 143
  Top = 273
  Width = 750
  Height = 417
  AutoSize = True
  Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1064#1077#1083#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 378
    ActivePage = tsSort
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object tsSort: TTabSheet
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object lbl1: TLabel
        Left = 24
        Top = 24
        Width = 51
        Height = 19
        Caption = #1052#1072#1089#1089#1080#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 424
        Top = 24
        Width = 87
        Height = 19
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lstSort: TListBox
        Left = 424
        Top = 48
        Width = 257
        Height = 265
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 19
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object edtMas: TEdit
        Left = 24
        Top = 48
        Width = 321
        Height = 27
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnGenerateMas: TButton
        Left = 120
        Top = 96
        Width = 129
        Height = 41
        Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1089#1089#1080#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        WordWrap = True
        OnClick = btnGenerateMasClick
      end
      object btnSort: TButton
        Left = 120
        Top = 176
        Width = 129
        Height = 41
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnSortClick
      end
      object btnExit1: TButton
        Left = 120
        Top = 256
        Width = 129
        Height = 41
        Caption = #1042#1099#1093#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnExit1Click
      end
    end
    object tsGraphics: TTabSheet
      Caption = #1043#1088#1072#1092#1080#1082#1080
      ImageIndex = 1
      object Chart: TChart
        Left = 0
        Top = 0
        Width = 726
        Height = 268
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Width = 2
        Title.Text.Strings = (
          '')
        Frame.Width = 2
        View3D = False
        Align = alClient
        TabOrder = 0
        object Line1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = #1057#1088#1072#1074#1085#1077#1085#1080#1103
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Line2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object pnlChart: TPanel
        Left = 0
        Top = 268
        Width = 726
        Height = 79
        Align = alBottom
        TabOrder = 1
        object btnGraph: TButton
          Left = 32
          Top = 24
          Width = 137
          Height = 33
          Caption = #1055#1077#1088#1077#1088#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          WordWrap = True
          OnClick = btnGraphClick
        end
        object btnExit: TButton
          Left = 576
          Top = 24
          Width = 137
          Height = 33
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          OnClick = btnExitClick
        end
        object rgCountElems: TRadioGroup
          Left = 224
          Top = 24
          Width = 305
          Height = 33
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1095#1080#1089#1083#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074' '#1084#1072#1089#1089#1080#1074#1077
          Columns = 3
          Items.Strings = (
            '100'
            '1000'
            '10000')
          TabOrder = 2
        end
      end
    end
  end
end
