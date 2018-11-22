unit ActiveFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ImgList;

type
  TFrmActiveFiles = class(TForm)
    ListView1: TListView;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmActiveFiles: TFrmActiveFiles;

implementation

{$R *.DFM}

end.
