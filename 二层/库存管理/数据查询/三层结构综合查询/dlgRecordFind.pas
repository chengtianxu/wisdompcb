unit dlgRecordFind;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, RzCmboBx, Mask, RzEdit, RzButton;

type
  TfrmdlgRecordFind = class(TForm)
    Label1: TLabel;
    comboxFieldList: TRzComboBox;
    edtValue: TRzEdit;
    Label2: TLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdlgRecordFind: TfrmdlgRecordFind;

implementation

{$R *.dfm}         

end.
