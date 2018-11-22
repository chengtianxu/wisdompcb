unit UEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl_EmpInfo: TLabel;
    rg_type: TRadioGroup;
    cbb_YM: TComboBox;
    edt_days: TEdit;
    memo1: TMemo;
    btn_save: TBitBtn;
    btn_close: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pflag: integer;
  end;

var
  FrmEdit: TFrmEdit;

implementation

uses USelEMP, UMain, UDM;

{$R *.dfm}

procedure TFrmEdit.FormShow(Sender: TObject);
var ssql: string;
begin

  lbl_EmpInfo.Caption :='员工信息: ' +
    '员工工号: ' + frmMain.qry_main.FieldValues['employeecode'] + ',    '
    + '员工姓名: ' + frmMain.qry_main.FieldValues['chinesename'] + ',    '
    + '所在部门: ' + frmMain.qry_main.FieldValues['departmentname'] + ',    '
    + '入职时间: ' + DateToStr(frmMain.qry_main.FieldValues['ondutytime']);

  if frmMain.qry_main.FieldValues['atype'] = 0  then
  rg_type.ItemIndex := 0
  else
  rg_type.ItemIndex := 1;

  edt_days.Text := frmMain.qry_main.fieldByName('days').AsString;
  Memo1.Text := frmMain.qry_main.fieldByName('remark').asstring;

  ssql:='select checkyearmonth  from  salarycheck  order by  checkyearmonth desc ';

 dm.OpenQry(dm.qry_temp,ssql);
 cbb_YM.Clear;

 if not dm.qry_temp.IsEmpty then
 with dm.qry_temp do
 begin
     first;
    while not eof do
    begin
    cbb_YM.Items.Add(fieldbyname('checkyearmonth').AsString);
    Next;
    end;
 end;

    cbb_YM.text:= frmMain.qry_main.fieldByName('yearmonth').asstring ;

     if pflag=1 then
      memo1.Text:='';

    if pflag=3 then
    begin
     Panel3.enabled:=false;
     btn_save.Enabled:=false;
     btn_close.Enabled:=true;
     end;
end;

procedure TFrmEdit.btn_saveClick(Sender: TObject);
var
  ssql:  string;
  atype : Integer;
  nrkey:integer;
begin


  if pflag<>2  then exit;
   nrkey:=frmMain.qry_main.fieldbyname('rkey').asinteger;

   if rg_type.ItemIndex= 0  then atype:=0 else atype:=1;
 try
   ssql:= 'update overWorkApply set atype='+inttostr(atype)+' , Yearmonth='''+cbb_ym.Text+''', days='+trim(edt_days.text)+', '+
          ' remark='''+trim(memo1.text)+'''   '+
          'where rkey='+inttostr(frmMain.qry_main.fieldbyname('rkey').asinteger)+' ';

   dm.execsql(dm.qry_temp,ssql);
   frmMain.btn_refreshClick(sender);

        with FrmMain do
        begin
          //Filtered:=false;
         rg_status.ItemIndex:=0;
         qry_main.locate('rkey', nrkey, []);

        end;


      self.close;

      
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 end;
 end;




 end;

end.
