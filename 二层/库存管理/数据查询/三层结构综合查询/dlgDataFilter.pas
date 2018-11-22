unit dlgDataFilter;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, RzCmboBx, Mask, RzEdit, RzButton, RzPanel, RzRadGrp;

type
  TfrmdlgDataFilter = class(TForm)
    Label1: TLabel;
    comboxFieldList: TRzComboBox;
    edtValue: TRzEdit;
    Label2: TLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    rgFilterType: TRzRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdlgDataFilter: TfrmdlgDataFilter;

implementation

{$R *.dfm}         

end.
