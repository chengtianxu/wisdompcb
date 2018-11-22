unit cust_del;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TFcust_del = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcust_del: TFcust_del;

implementation

uses damo;

{$R *.dfm}

end.
