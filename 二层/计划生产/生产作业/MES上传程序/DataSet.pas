unit DataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl;

type
  TFrmDataSet = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataSet: TFrmDataSet;

implementation

{$R *.dfm}

end.
