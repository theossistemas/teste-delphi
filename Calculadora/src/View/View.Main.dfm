object ViewMain: TViewMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Calculadora'
  ClientHeight = 629
  ClientWidth = 396
  Color = 15132390
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  DesignSize = (
    396
    629)
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTop: TPanel
    Left = 3
    Top = 3
    Width = 390
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    Color = 15132390
    ParentBackground = False
    TabOrder = 0
    object imgMenu: TImage
      Left = 0
      Top = 0
      Width = 41
      Height = 38
      Align = alLeft
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
        000000180806000000E0773DF80000000467414D410000B18F0BFC6105000000
        206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
        98000017709CBA513C00000006624B4744000000000000F943BB7F0000000970
        485973000000600000006000F06B42CF000000304944415448C763601805A380
        52C088CC515454FC4F0D43EFDFBF0F379769A07D380A4623792480D1481E05A3
        808101006F1F0C0AD883E44F0000002574455874646174653A63726561746500
        323032312D31322D30375432303A31383A35322B30303A30301BD68324000000
        2574455874646174653A6D6F6469667900323032312D31322D30375432303A31
        383A35322B30303A30306A8B3B980000000049454E44AE426082}
      Transparent = True
      OnClick = imgMenuClick
    end
    object lblType: TLabel
      AlignWithMargins = True
      Left = 51
      Top = 3
      Width = 61
      Height = 32
      Margins.Left = 10
      Align = alLeft
      Caption = 'Padr'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Light'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 25
    end
  end
  object pnlInternal: TPanel
    Left = 3
    Top = 41
    Width = 390
    Height = 585
    Align = alClient
    BevelOuter = bvNone
    Color = 15132390
    ParentBackground = False
    TabOrder = 1
    object pnlTax: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 197
      Width = 390
      Height = 40
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 1
      Align = alBottom
      BevelOuter = bvNone
      Color = 15132390
      ParentBackground = False
      TabOrder = 0
      object gpTax: TGridPanel
        Left = 0
        Top = 0
        Width = 390
        Height = 40
        Align = alClient
        BevelOuter = bvNone
        Color = 15790320
        ColumnCollection = <
          item
            Value = 33.333333333333350000
          end
          item
            Value = 33.333333333333330000
          end
          item
            Value = 33.333333333333320000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnlTaxA
            Row = 0
          end
          item
            Column = 1
            Control = pnlTaxB
            Row = 0
          end
          item
            Column = 2
            Control = pnlTaxC
            Row = 0
          end>
        ParentBackground = False
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        TabOrder = 0
        Visible = False
        object pnlTaxA: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 129
          Height = 38
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Imposto A'
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = pnlTaxAClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
        object pnlTaxB: TPanel
          AlignWithMargins = True
          Left = 131
          Top = 1
          Width = 128
          Height = 38
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Imposto B'
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          OnClick = pnlTaxBClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
        object pnlTaxC: TPanel
          AlignWithMargins = True
          Left = 260
          Top = 1
          Width = 130
          Height = 38
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Imposto C'
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          OnClick = pnlTaxCClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
      end
    end
    object pnlCalc1: TPanel
      Left = 0
      Top = 305
      Width = 390
      Height = 280
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object gpNumbers: TGridPanel
        Left = 0
        Top = 0
        Width = 292
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 33.333333333333350000
          end
          item
            Value = 33.333333333333330000
          end
          item
            Value = 33.333333333333320000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnlNum7
            Row = 0
          end
          item
            Column = 1
            Control = pnlNum8
            Row = 0
          end
          item
            Column = 2
            Control = pnlNum9
            Row = 0
          end
          item
            Column = 0
            Control = pnlNum4
            Row = 1
          end
          item
            Column = 1
            Control = pnlNum5
            Row = 1
          end
          item
            Column = 2
            Control = pnlNum6
            Row = 1
          end
          item
            Column = 0
            Control = pnlNum1
            Row = 2
          end
          item
            Column = 1
            Control = pnlNum2
            Row = 2
          end
          item
            Column = 2
            Control = pnlNum3
            Row = 2
          end
          item
            Column = 0
            Control = pnlNum0
            Row = 3
          end
          item
            Column = 1
            Control = pnlComma
            Row = 3
          end
          item
            Column = 2
            Control = pnlEqual
            Row = 3
          end>
        RowCollection = <
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end>
        TabOrder = 0
        object pnlNum7: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 96
          Height = 68
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '7'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum8: TPanel
          AlignWithMargins = True
          Left = 98
          Top = 1
          Width = 95
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '8'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum9: TPanel
          AlignWithMargins = True
          Left = 195
          Top = 1
          Width = 96
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '9'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum4: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 71
          Width = 96
          Height = 68
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '4'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum5: TPanel
          AlignWithMargins = True
          Left = 98
          Top = 71
          Width = 95
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '5'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum6: TPanel
          AlignWithMargins = True
          Left = 195
          Top = 71
          Width = 96
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '6'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum1: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 141
          Width = 96
          Height = 68
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '1'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum2: TPanel
          AlignWithMargins = True
          Left = 98
          Top = 141
          Width = 95
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '2'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 7
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum3: TPanel
          AlignWithMargins = True
          Left = 195
          Top = 141
          Width = 96
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '3'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 8
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlNum0: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 211
          Width = 96
          Height = 68
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '0'
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 9
          OnClick = DoClickNumber
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlComma: TPanel
          AlignWithMargins = True
          Left = 98
          Top = 211
          Width = 95
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = ','
          Color = 16448250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 10
          OnClick = pnlCommaClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorNumberLeave
        end
        object pnlEqual: TPanel
          AlignWithMargins = True
          Left = 195
          Top = 211
          Width = 96
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '='
          Color = 14596746
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -33
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 11
          OnClick = pnlEqualClick
        end
      end
      object gpOperators: TGridPanel
        Left = 292
        Top = 0
        Width = 98
        Height = 280
        Align = alRight
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnlOperatorDivide
            Row = 0
          end
          item
            Column = 0
            Control = pnlOperatorMultiply
            Row = 1
          end
          item
            Column = 0
            Control = pnlOperatorSubtract
            Row = 2
          end
          item
            Column = 0
            Control = pnlOperatorSum
            Row = 3
          end>
        RowCollection = <
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end>
        TabOrder = 1
        object pnlOperatorDivide: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 97
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = #247
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -33
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = pnlOperatorDivideClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
        object pnlOperatorMultiply: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 71
          Width = 97
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = #739
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -53
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          OnClick = pnlOperatorMultiplyClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
        object pnlOperatorSubtract: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 141
          Width = 97
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '-'
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -33
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          OnClick = pnlOperatorSubtractClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
        object pnlOperatorSum: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 211
          Width = 97
          Height = 68
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alClient
          BevelOuter = bvNone
          Caption = '+'
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -33
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          OnClick = pnlOperatorSumClick
          OnMouseEnter = DoModifyColorNumberEnter
          OnMouseLeave = DoModifyColorOperatorsLeave
        end
      end
    end
    object pnlResults: TPanel
      Left = 0
      Top = 0
      Width = 390
      Height = 196
      Align = alClient
      BevelOuter = bvNone
      Color = 15132390
      ParentBackground = False
      TabOrder = 2
      object lblResult: TLabel
        Left = 0
        Top = 49
        Width = 390
        Height = 147
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        EllipsisPosition = epPathEllipsis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = -51
        ExplicitWidth = 441
        ExplicitHeight = 142
      end
      object pnlHistory: TPanel
        Left = 0
        Top = 0
        Width = 390
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 15
        Padding.Right = 15
        TabOrder = 0
        object lblHistory: TLabel
          Left = 15
          Top = 0
          Width = 360
          Height = 49
          Align = alClient
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4868682
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 371
          ExplicitWidth = 4
          ExplicitHeight = 20
        end
      end
    end
    object gpClear: TGridPanel
      Left = 0
      Top = 238
      Width = 390
      Height = 67
      Align = alBottom
      BevelOuter = bvNone
      Color = 15790320
      ColumnCollection = <
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = pnlPlusMinus
          Row = 0
        end
        item
          Column = 1
          Control = pnlCE
          Row = 0
        end
        item
          Column = 2
          Control = pnlC
          Row = 0
        end
        item
          Column = 3
          Control = pnlBackspace
          Row = 0
        end>
      ParentBackground = False
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 3
      object pnlPlusMinus: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 96
        Height = 65
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BevelOuter = bvNone
        Caption = '+/-'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = pnlPlusMinusClick
        OnMouseEnter = DoModifyColorNumberEnter
        OnMouseLeave = DoModifyColorOperatorsLeave
      end
      object pnlCE: TPanel
        AlignWithMargins = True
        Left = 98
        Top = 1
        Width = 96
        Height = 65
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BevelOuter = bvNone
        Caption = 'CE'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = pnlCEClick
        OnMouseEnter = DoModifyColorNumberEnter
        OnMouseLeave = DoModifyColorOperatorsLeave
      end
      object pnlC: TPanel
        AlignWithMargins = True
        Left = 195
        Top = 1
        Width = 96
        Height = 65
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BevelOuter = bvNone
        Caption = 'C'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = pnlCClick
        OnMouseEnter = DoModifyColorNumberEnter
        OnMouseLeave = DoModifyColorOperatorsLeave
      end
      object pnlBackspace: TPanel
        AlignWithMargins = True
        Left = 292
        Top = 1
        Width = 98
        Height = 65
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alClient
        BevelOuter = bvNone
        Caption = #8592
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = pnlBackspaceClick
        OnMouseEnter = DoModifyColorNumberEnter
        OnMouseLeave = DoModifyColorOperatorsLeave
      end
    end
  end
  object svOptions: TSplitView
    Left = 3
    Top = 41
    Width = 0
    Height = 585
    Color = 15132390
    DisplayMode = svmOverlay
    Opened = False
    OpenedWidth = 250
    Placement = svpLeft
    TabOrder = 2
    object lblCalc: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 10
      Width = -18
      Height = 17
      Margins.Left = 15
      Margins.Top = 10
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Calculadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 72
    end
    object pnlDefault: TPanel
      Left = 0
      Top = 32
      Width = 0
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 13619151
      ParentBackground = False
      TabOrder = 0
      OnClick = DoClickCalcArithmetic
      object imgCalc: TImage
        Left = 0
        Top = 0
        Width = 41
        Height = 41
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF80000000467414D410000B18F0BFC6105000000
          206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
          98000017709CBA513C00000006624B4744000000000000F943BB7F0000000970
          485973000000600000006000F06B42CF0000009E4944415448C7ED555B0EC230
          0CB3A3DD82C75D9A5FEED133B193F0971E66DC237CC00742610B20B44D9AFF5A
          ABB61C570AB07630BA2CA59C48F60076499D2B806A669757424257F2FC813800
          ECDDBD8F88EEDD0300303322015575928788938CC02F58BF413746AAAA2F3EC1
          A88199F1F9274D9D674910BA7F3BFB28CDD6C124B60E96DBC180C74EC8C2DD87
          D6DA319BA0E2BE06D3E22252FF3D8D7970038CFB4E4EEC85580E000000257445
          5874646174653A63726561746500323032312D31322D30375432303A32393A32
          312B30303A303056DB9D9F0000002574455874646174653A6D6F646966790032
          3032312D31322D30375432303A32393A32312B30303A30302786252300000000
          49454E44AE426082}
        Transparent = True
        OnClick = DoClickCalcArithmetic
      end
      object lblDefault: TLabel
        AlignWithMargins = True
        Left = 46
        Top = 3
        Width = 42
        Height = 35
        Margins.Left = 5
        Align = alClient
        Caption = 'Padr'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = DoClickCalcArithmetic
        ExplicitHeight = 17
      end
    end
    object pnlTypeTax: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 76
      Width = 0
      Height = 41
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = 13619151
      ParentBackground = False
      TabOrder = 1
      OnClick = DoClickCalcTax
      object imgTypeTax: TImage
        Left = 0
        Top = 0
        Width = 41
        Height = 41
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF80000000467414D410000B18F0BFC6105000000
          206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
          98000017709CBA513C00000006624B4744000000000000F943BB7F0000000970
          485973000000600000006000F06B42CF000001684944415448C7ED943D4EC340
          1085DF6C2CA5E30220A1F810200A1763D30484440347E002404054B888448242
          4F459F829248513CA6A3E10C18012D0D9D9B5D1A1B59F96365BB41E275AB9D79
          9FDECE6A807FFD222A1E987997886E01AC5AF6872272B9ACA0513CB8AE2B00D6
          2CCD5F01ECB75A2D4A92E4D12A81EFFB060044841635E4354AA975AD750CC005
          D01391F379F5AADCCB0293C9E44D29C5005E009CF9BE7F552BC01652096003A9
          0C980729DE39654DF361E7D25A03C0BDE338DBB527C874E779DEC1783C4E2A25
          58F6854504D90C988876A228FAAC3301DAEDF60A802D001BC698875209162908
          827E9AA69B4474688C190278AA0D100441DF18730A00C69861B3D9DC1B8D465F
          400D4366E66E6E9E019E73F3CA0066EE12D145C1FC268EE3E3624D69C0B43980
          C1B43930BB4DDFB1645D7B9ED708C35033738F883A3F2644D7511475E6F54C27
          3802F0B1081086A1CE0CADCC6712D8AAB02606227252F699FF86BE0137878C40
          EBF109FE0000002574455874646174653A63726561746500323032312D31322D
          30375432303A32393A34382B30303A3030052CD1CB0000002574455874646174
          653A6D6F6469667900323032312D31322D30375432303A32393A34382B30303A
          3030747169770000000049454E44AE426082}
        Transparent = True
        OnClick = DoClickCalcTax
      end
      object lblTypeTax: TLabel
        AlignWithMargins = True
        Left = 46
        Top = 3
        Width = 48
        Height = 35
        Margins.Left = 5
        Align = alClient
        Caption = 'Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = DoClickCalcTax
        ExplicitHeight = 17
      end
    end
  end
end
