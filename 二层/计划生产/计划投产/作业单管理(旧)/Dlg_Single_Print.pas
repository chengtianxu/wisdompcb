unit Dlg_Single_Print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmDlg_Single_Print = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    CheckBox2: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlg_Single_Print: TfrmDlg_Single_Print;

implementation

{$R *.dfm}

end.
