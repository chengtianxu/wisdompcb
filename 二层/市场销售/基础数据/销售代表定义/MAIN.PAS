unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, ADODB, ToolWin,
  ExtCtrls, Mask, DBCtrls, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    add_rep: TMenuItem;
    edit_rep: TMenuItem;
    N4: TMenuItem;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1REP_CODE: TStringField;
    ADOTable1SALES_REP_NAME: TStringField;
    ADOTable1ABBR_NAME: TStringField;
    ADOTable1ADDRESS_LINE_1: TStringField;
    ADOTable1ADDRESS_LINE_2: TStringField;
    ADOTable1ADDRESS_LINE_3: TStringField;
    ADOTable1STATE: TStringField;
    ADOTable1ZIP: TStringField;
    ADOTable1PHONE: TStringField;
    ADOTable1FAX: TStringField;
    ADOTable1TELEX: TStringField;
    ADOTable1CURRENCY_PTR: TIntegerField;
    ADOTable1NOTE_PAD_PTR: TIntegerField;
    ADOTable1CONTACT_NAME_1: TStringField;
    ADOTable1CONTACT_NAME_2: TStringField;
    ADOTable1CONTACT_NAME_3: TStringField;
    ADOTable1CONTACT_NAME_4: TStringField;
    ADOTable1CONTACT_NAME_5: TStringField;
    ADOTable1CONTACT_NAME_6: TStringField;
    ADOTable1CONT_PHONE_1: TStringField;
    ADOTable1CONT_PHONE_2: TStringField;
    ADOTable1CONT_PHONE_3: TStringField;
    ADOTable1CONT_PHONE_4: TStringField;
    ADOTable1CONT_PHONE_5: TStringField;
    ADOTable1CONT_PHONE_6: TStringField;
    ADOTable1YTD_SALES: TFloatField;
    ADOTable1LYR_SALES: TFloatField;
    ADOTable1YTD_BILLING: TFloatField;
    ADOTable1LYR_BILLING: TFloatField;
    ADOTable1VOLUME_1: TFloatField;
    ADOTable1VOLUME_2: TFloatField;
    ADOTable1VOLUME_3: TFloatField;
    ADOTable1VOLUME_4: TFloatField;
    ADOTable1COMMISSION_1: TFloatField;
    ADOTable1COMMISSION_2: TFloatField;
    ADOTable1COMMISSION_3: TFloatField;
    ADOTable1COMMISSION_4: TFloatField;
    ADOTable1COMMISSION_5: TFloatField;
    ADOTable1PROJECTION_1: TFloatField;
    ADOTable1PROJECTION_2: TFloatField;
    ADOTable1PROJECTION_3: TFloatField;
    ADOTable1PROJECTION_4: TFloatField;
    ADOTable1PROJECTION_5: TFloatField;
    ADOTable1PROJECTION_6: TFloatField;
    ADOTable1PROJECTION_7: TFloatField;
    ADOTable1PROJECTION_8: TFloatField;
    ADOTable1PROJECTION_9: TFloatField;
    ADOTable1PROJECTION_10: TFloatField;
    ADOTable1PROJECTION_11: TFloatField;
    ADOTable1PROJECTION_12: TFloatField;
    ADOTable1COMMISSION_DUE: TFloatField;
    ADOTable1DEBITS: TFloatField;
    ADOTable1SALES_REGION: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    ADOConnection1: TADOConnection;
    copy_rep: TMenuItem;
    Panel1: TPanel;
    ADOTable1TOOLING_FLAG: TWordField;
    ADOTable1RUSH_CHRG_COMM_FLAG: TWordField;
    ADOTable1CLASS: TWordField;
    ADOTable1EMPLOYEE_PTR: TIntegerField;
    ADOTable1class_type: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure edit_repClick(Sender: TObject);
    procedure add_repClick(Sender: TObject);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure N4Click(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure copy_repClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses edit_rep, note,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.edit_repClick(Sender: TObject);
begin
 adotable1.Edit;
 form1.Hide;
 form2.ShowModal;
end;

procedure TForm1.add_repClick(Sender: TObject);
begin

   Adotable1.Append;
   Adotable1currency_ptr.Value:=1; //用本位币赋值
   Adotable1tooling_flag.Value:=0;
   Adotable1rush_chrg_comm_flag.Value:=0;
   hide;
   form2.ShowModal;

end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据保存失败,请检查编号是否重复?!',mtwarning,[mbok],0);
 abort;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
with form2.adoquery2 do
 begin
   close;
   Parameters[0].Value:=ADOTable1NOTE_PAD_ptr.Value;
   active:=true;
 end;
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  adotable1.Delete;
  while not form2.ADOQuery2.IsEmpty  do
   form2.ADOQuery2.Delete;
 end;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 if pos('Data0263',e.Message)<>0 then
   begin
    messagedlg('不能删除该记录,已用于按客户及产品分类的拥金中',mtwarning,[mbcancel],0);
    abort;
   end
 else
  if pos('Data0012',e.Message)<>0 then
   begin
    messagedlg('不能删除该记录,已用于客户装运地址表中',mtwarning,[mbcancel],0);
    abort;
   end
  else
  if pos('Data0010',e.Message)<>0 then
   begin
    messagedlg('不能删除该记录,已用于客户表中',mtwarning,[mbcancel],0);
    abort;
   end;
end;

procedure TForm1.copy_repClick(Sender: TObject);
var
 v_recode:array[2..57] of variant;
 i:word;
begin
for i:=2 to 57 do
  v_recode[i]:=adotable1.Fields[i].Value;

with form2.adoquery2 do
 begin
  if active=true then active:=false;
   Parameters[0].Value:=ADOTable1NOTE_PAD_ptr.Value;
   active:=true;
   if not IsEmpty then           //复制记事本
   for i:=1 to 4 do
   begin
   form3.memo1.lines.add(fieldbyname('note_pad_line_'+inttostr(i)).asstring);
   form3.memo2.lines.add(fieldbyname('note_pad_line_'+inttostr(i)).asstring);
   end;
 end;
 adotable1.Append;
 for i:=2 to 57 do
 adotable1.fieldvalues[adotable1.Fields[i].FieldName]:=v_recode[i];
 adotable1.fieldvalues[adotable1.Fields[13].FieldName]:=null;
 form1.Hide;
 form2.ShowModal;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //如果按下了backspace
  begin
   if length(bar1.SimpleText)>5 then
    bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
   if length(bar1.SimpleText)>5 then
    Adotable1.Locate(adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
   else
    adotable1.First
  end
 else
  if key=chr(vk_return) then    //如果按下了enter
   edit_repclick(sender)           //调用编辑命令
  ELSE
   begin
    bar1.SimpleText := bar1.SimpleText+key;
    Adotable1.Locate(adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
   end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if column.Index=1 then
   begin
    column.Title.Caption:='*'+'姓名';
    dbgrid1.Columns[0].Title.Caption:='代码';
    adotable1.IndexFieldNames:='sales_rep_name';
   end
 else
  if column.Index=0 then 
   begin
    column.Title.Caption:='*'+'代码';
    dbgrid1.Columns[1].Title.Caption:='姓名';
    adotable1.IndexFieldNames:='rep_code';
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if not App_Init(adoconnection1) then
 begin
  ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
  application.Terminate;
 end;
 self.Caption := application.Title; 
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 adotable1.Open;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if adotable1.IsEmpty then
 begin
  edit_rep.Enabled:=false;
  copy_rep.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  edit_rep.Enabled:=true;
  copy_rep.Enabled:=true;
  n4.Enabled:=true;
 end;
end;

procedure TForm1.ADOTable1CalcFields(DataSet: TDataSet);
begin
case self.ADOTable1CLASS.Value of
 0 :self.ADOTable1class_type.Value:='成员';
 1 :self.ADOTable1class_type.Value:='主管';
 2 :self.ADOTable1class_type.Value:='高级主管'; 
end;
end;

end.
