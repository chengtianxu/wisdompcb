unit Getfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl, Spin,DateUtils;

type
  TFrmGetfile = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FileListBox1: TFileListBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure FileListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGetfile: TFrmGetfile;

implementation

{$R *.dfm}

procedure TFrmGetfile.FileListBox1DblClick(Sender: TObject);
begin
  modalresult:=mrOk;
end;

end.
