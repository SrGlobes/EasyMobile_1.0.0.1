object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'SERVER'
  ClientHeight = 235
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = ButtonStartClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 84
    Width = 121
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Porta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
  end
  object ButtonStart: TButton
    Left = 56
    Top = 24
    Width = 90
    Height = 30
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 289
    Top = 24
    Width = 90
    Height = 30
    Caption = 'Stop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 152
    Top = 123
    Width = 121
    Height = 32
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '80'
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    OnMinimize = ApplicationEvents1Minimize
    Left = 232
    Top = 32
  end
  object TrayIcon1: TTrayIcon
    Animate = True
    BalloonHint = 'Server - EasyMobile'
    BalloonFlags = bfInfo
    PopupMenu = PopupMenu1
    OnClick = TrayIcon1Click
    Left = 320
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 176
    object Restaurar1: TMenuItem
      Caption = 'Restaurar'
      OnClick = Restaurar1Click
    end
    object Fechar1: TMenuItem
      Caption = 'Encerrar'
      OnClick = Fechar1Click
    end
  end
end
