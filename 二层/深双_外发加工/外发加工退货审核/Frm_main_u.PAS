unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls,
  Menus,adodb, DB, DBGridEh, ExtCtrls;

type
  TFrm_main = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Splitter1: TSplitter;
    BitBtn3: TBitBtn;
    N3: TMenuItem;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    dbgrid1: TDBGridEh;
    N2: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
   procedure init;
  public
  end;

var
  Frm_main: TFrm_main;

implementation
uses DM_u,common,Frm_QrySet_u;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not app_init(dm.ADOCon) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;
 self.Caption:=application.Title;

 //user_ptr:='851';
// vprev:='4';
// dm.ADOCon.Open;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 init;
end;

procedure TFrm_main.init;
begin
  field_name := dbgrid1.Columns[0].FieldName;
  PreColumn := dbgrid1.Columns[0];
  dbgrid1.Columns[0].Title.Color := clred ;

  sSql:=DM.wzdata306.SQL.Text;
  FsSearch:=' where wzdata306.ent_date>=getdate()-7 ';
  CheckBox1Click(nil);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  FsCheck:=' and WZDATA306.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  DM.wzdata306.SQL.Text:=sSql+FsSearch+FsCheck;
  DM.wzdata306.Close;
  DM.wzdata306.Open;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.wzdata306.IsEmpty then
  begin
    N1.Enabled:=false;   //批准
    N2.Enabled:=false;   //退回
    N3.Enabled:=false;   //取消审核
  end else begin
    N1.Enabled:=((vprev='2') or (vprev='4')) and (DM.wzdata306STATUS.Value=2);
    N2.Enabled:=N1.Enabled;
    N3.Enabled:=((vprev='2') or (vprev='4')) and (DM.wzdata306STATUS.Value=3);
  end;
end;


procedure TFrm_main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.wzdata306.SQL.Text);
end;


procedure TFrm_main.BitBtn3Click(Sender: TObject);
var
 rkey306: integer;
begin
  rkey306:=0;
  if not dm.wzdata306.IsEmpty then  rkey306:=dm.wzdata306rkey.Value;
  dm.wzdata306.Close;
  dm.wzdata306.Open;
  dm.wzdata306.Locate('rkey',rkey306,[]);
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.wzdata306status.Value = 5 then
     DBGrid1.Canvas.Font.Color := clred
  else if dm.wzdata306status.Value = 2 then
     DBGrid1.Canvas.Font.Color := clteal ;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      dbgrid1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.dbgrid1TitleClick(Column: TColumnEh);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.wzdata306.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.wzdata306.Sort:=Column.FieldName+' DESC';
  end;
  DM.wzdata306AfterScroll(DM.wzdata306);
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  dbgrid1TitleClick(PreColumn);
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzdata306.ent_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and wzdata306.ent_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
   CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var str:string;
begin
  DM.Tmp.Close;
  case Tmenuitem(Sender).Tag of
    0: begin
        // 审核
         DM.Tmp.SQL.Text:='update wzdata306 set status=3,auth_date=getdate(),auth_empl='+user_ptr+' where rkey='+DM.wzdata306rkey.AsString+' and status=2';
       end;
    1: begin //退回
         if not inputquery('退回信息','请输入被退回信息 ',str) then
           exit
         else
          DM.Tmp.SQL.Text:='update wzdata306 set status=5,remark='''+str+''' where rkey='+DM.wzdata306rkey.AsString+' and status=2';
        end;
    2: begin  //取消审核
         DM.Tmp.SQL.Text:='select top 1 rkey from wzdata307 where rejected_ptr='+DM.wzdata306rkey.AsString+
                          ' and received_qty>0';
         DM.Tmp.Open ;
         if not DM.Tmp.IsEmpty then
         begin
           showmessage('此退货单已有收货,不能再取消审核!');
           exit;
         end;
         DM.Tmp.Close;
         DM.Tmp.SQL.Text:='update wzdata306 set status=2,auth_date=null,auth_empl=null where rkey='+DM.wzdata306rkey.AsString+' and status=3';
       end;
  end;
  if DM.Tmp.ExecSQL<>1 then
    showmessage('当前数据记录状态发生变化,操作失败!');
  BitBtn3Click(nil);
end;

end.
