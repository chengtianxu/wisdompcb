unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  Tfm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    eh1: TDBGridEh;
    PM1: TPopupMenu;
    N1: TMenuItem;
    BitBtn4: TBitBtn;
    PM2: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
  private
    { Private declarations }
    precolumn:Tcolumneh;
    sql_text:string;
    procedure item_click(sender:Tobject);
    function set_lock:boolean;
  public
    { Public declarations }
  end;

var
  fm_main: Tfm_main;

implementation

uses damo,common, condition, detail;

{$R *.dfm}

procedure Tfm_main.FormCreate(Sender: TObject);
var i:byte;
    item:Tmenuitem;
begin
 if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败，请与系统管理员联系！',1);
  application.Terminate;
 end;
 {vprev:='4';
 user_ptr:='943';
 rkey73:='782'; }
 
 self.Caption:=application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 sql_text:=dm.ads22.CommandText;  //记录ads10默认sql语句
 precolumn:=eh1.Columns[0]; //给precolumn赋初始值

 for i:=1 to eh1.columns.Count do
 begin //动态增加列名到字段菜单中
  item:=Tmenuitem.Create(self);
  item.Caption:=eh1.columns[i-1].Title.caption;
  if eh1.Columns[i-1].Visible then
   item.Checked:=true;
  item.onClick:=item_click;
  self.PM2.Items.Add(item);
 end;
end;

procedure Tfm_main.item_click(sender:Tobject);
var i:byte;
begin
 (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
 if (sender as Tmenuitem).Checked then
  for i:=0 to eh1.Columns.Count-1 do
   if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
   begin
    eh1.Columns[i].Visible:=true;
    break;
   end;
 if not (sender as Tmenuitem).Checked then
  for i:=0 to eh1.Columns.Count-1 do
   if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
   begin
    eh1.Columns[i].Visible:=false;
    break;
   end;
end;

function Tfm_main.set_lock:boolean;
begin
 result:=false;
  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d22'')'+#13+
     ' select rkey from ##d22 where rkey='+dm.ADS22.fieldbyname('rkey').AsString+#13+
     ' else select top 0 * from data0022 ';
   Open;
   if not isempty then
   begin
    messagedlg('当前入库明细记录被其它用户锁定，无法编辑！',mtwarning,[mbok],0);
    exit;
   end
   else begin
    close;
    SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d22'')'+#13+
      ' begin set identity_insert ##d22 on '+#13+
      ' insert ##d22(rkey) values( '''+dm.ADS22.fieldbyname('rkey').AsString+''') '+
      ' set identity_insert ##d22 off end '+#13+
      ' else select rkey into ##d22 from data0022 where rkey='''+dm.ADS22.fieldbyname('rkey').AsString+'''';
    execsql;
    result:=true;
   end;
  end;
end;

procedure Tfm_main.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure Tfm_main.BitBtn2Click(Sender: TObject);
var rkey22:integer;
begin
 if dm.ADS22.Active then
 begin
  rkey22:=dm.ADS22rkey.Value;
  dm.ADS22.Close;
  dm.ADS22.Open;
  if rkey22>0 then dm.ADS22.Locate('rkey',rkey22,[]);
 end;
end;

procedure Tfm_main.BitBtn3Click(Sender: TObject);
var i:byte;
begin
 if fm_condition.ShowModal=mrok then
  with dm.ads22 do
  begin
   close;
   commandtext:=sql_text; //恢复默认语句
   for i:=1 to fm_condition.SGrid1.RowCount-1 do
     CommandText:=CommandText+fm_condition.SGrid1.cells[2,i];
   if fm_condition.CheckBox1.Checked=true then
     CommandText:=CommandText+' and d22.quan_on_hand>0';
   parameters.ParamByName('dtpk1').Value:=fm_condition.dtpk1.Date;
   parameters.ParamByName('dtpk2').Value:=fm_condition.dtpk2.Date+1;
   Prepared;
   open;
  end;
end;

procedure Tfm_main.eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ADS22.CommandText);
end;

procedure Tfm_main.eh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker=smupeh then
 begin
  column.Title.SortMarker:=smdowneh;
  dm.ads22.IndexFieldNames:=column.FieldName+' DESC';
 end
 else begin
  column.Title.SortMarker:=smupeh;
  dm.ads22.IndexFieldNames:=column.FieldName;
 end;

 if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
 begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
  label1.Caption:='搜索：'+column.Title.Caption;
  precolumn.Title.Color:=clbtnface;
  column.Title.Color:=clred;
  precolumn:=column;
  edit1.Text:='';
 end;
 edit1.SetFocus;
end;

procedure Tfm_main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ads22.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else dm.ads22.Filter:='';
end;

procedure Tfm_main.FormShow(Sender: TObject);
begin
 dm.ADS22.CommandText:=sql_text+' and (d22.quan_on_hand>0)';
 dm.ADS22.Parameters.ParamByName('dtpk1').Value:=datetostr(now-90);
 dm.ADS22.Parameters.ParamByName('dtpk2').Value:=datetostr(now+1);
 dm.ADS22.Prepared;
 dm.ADS22.Open;
end;

procedure Tfm_main.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else if set_lock then begin //未锁定
  dm.AQ22.Close;
  dm.AQ22.Parameters[0].Value:=dm.ADS22rkey.Value;
  dm.AQ22.Open;

  fm_detail:=Tfm_detail.Create(application);
  if fm_detail.ShowModal=mrok then begin end;

  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d22'')'+#13+
     ' select rkey from ##d22 where rkey='+dm.ADS22.fieldbyname('rkey').AsString+#13+
     ' else select top 0 * from data0022 ';
   Open;
   if not isempty then delete;
  end;

  dm.ADS22.Close; //刷新
  dm.ADS22.Open;
  dm.ADS22.Locate('rkey',dm.AQ22rkey.Value,[]);  
  fm_detail.Free;
 end;
end;

procedure Tfm_main.BitBtn4Click(Sender: TObject);
begin
 pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tfm_main.PM1Popup(Sender: TObject);
begin
 if dm.ADS22.IsEmpty then n1.Enabled:=false
 else n1.Enabled:=true;
end;

end.
