unit unusual_cate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ADODB, Grids, DBGridEh, ExtCtrls;

type
  TFrm_unusual_cate = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADO43: TADOTable;
    ADO43rkey: TAutoIncField;
    ADO43unusual_cate: TWideStringField;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_unusual_cate: TFrm_unusual_cate;

implementation

uses damo,common;

{$R *.dfm}

procedure TFrm_unusual_cate.FormShow(Sender: TObject);
var
  i:Byte;
begin
  if strtoint(vprev)<>4 then
  begin
    DBGridEh1.ReadOnly:=True;
  end;
  ADO43.Open;
end;

procedure TFrm_unusual_cate.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if strtoint(vprev)=4 then
  begin
    if (key=46) and (ssCtrl in shift) then
    begin
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='delete data0043 where unusual_cate='
                          +quotedstr(ADO43unusual_cate.Value);
        ExecSQL;
        ADO43.Close;
        ADO43.Open;
      end;
    end;
    if (key=46) and (ssCtrl in shift) then Abort;
  end;
end;
end.



