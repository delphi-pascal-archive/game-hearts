object Form2: TForm2
  Left = 318
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Option dame de pic'
  ClientHeight = 340
  ClientWidth = 409
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 153
    Caption = 'Nom des joueurs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 129
      Height = 24
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 16
      Top = 48
      Width = 129
      Height = 24
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 16
      Top = 80
      Width = 129
      Height = 24
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 16
      Top = 112
      Width = 129
      Height = 24
      TabOrder = 3
      Text = 'Edit4'
    end
  end
  object GroupBox2: TGroupBox
    Left = 176
    Top = 184
    Width = 225
    Height = 153
    Caption = 'modification du total des points '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Edit5: TEdit
      Left = 40
      Top = 64
      Width = 89
      Height = 24
      TabOrder = 0
      Text = 'Edit5'
    end
    object UpDown1: TUpDown
      Left = 136
      Top = 64
      Width = 25
      Height = 25
      Min = 20
      Max = 200
      Increment = 5
      Position = 20
      TabOrder = 1
      Wrap = False
      OnClick = UpDown1Click
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 184
    Width = 161
    Height = 153
    Caption = 'Option carte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 224
    Width = 113
    Height = 17
    Caption = 'Masquer les cartes'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 256
    Width = 105
    Height = 25
    Caption = 'Montrer les cartes'
    TabOrder = 4
    OnClick = RadioButton2Click
  end
  object Button1: TButton
    Left = 272
    Top = 16
    Width = 73
    Height = 33
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 64
    Width = 73
    Height = 33
    Caption = 'Annuler'
    TabOrder = 6
    OnClick = Button2Click
  end
end
