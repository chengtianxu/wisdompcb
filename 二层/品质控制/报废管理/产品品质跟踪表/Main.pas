unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    TreeView1: TTreeView;
    N1: TMenuItem;
    BitBtn2: TBitBtn;
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure get_treedate(rkey25:integer;treeview:Ttreeview);
    function get_date0025toprkey(rkey25: integer):integer;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   sql_text:tstringlist;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses demo, quality_trace, Condition,common, frm_ProcedureReport1,
  ProductMix;

{$R *.dfm}

procedure TForm1.N9Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin            
try
 application.CreateForm(tForm2,Form2);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
if form2.ShowModal=mrok then
begin
end;
finally
 form2.free;
end
end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;
 self.caption:=application.Title;
 
// dm.ADOConnection1.Open;
// rkey73:='3';
// vprev:='4';

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var rkey:integer;
begin
 rkey:=dm.ads25rKEY.Value;
 dm.ADS25.Close;
 dm.ADS25.Prepared;
 dm.ADS25.Open;
 if rkey>0 then dm.ADS25.Locate('rkey',rkey,[]);
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
    item:TMenuItem;
begin
 if dm.ADOConnection1.Connected then
 begin
   PreColumn := DBGrid1.Columns[0];
   dm.ADS25.Close;
   dm.ADS25.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.adoquery1,1)-90;
   dm.ADS25.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.adoquery1,1);
   dm.ADS25.Prepared;
   dm.ADS25.Open;
   sql_text:=tstringlist.Create;
   sql_text.Text := dm.ADS25.CommandText;
   DM.ADS25.Close;
   DM.ADS25.CommandText := DM.ADS25.CommandText+'and data0025.ttype=1';
   DM.ADS25.Open;
   Form3.SGrid1.RowCount := Form3.SGrid1.RowCount+1;
   Form3.sgrid1.Cells[0,1]:='产品属性';
   Form3.sgrid1.Cells[2,1]:='and data0025.ttype=1';
   Form3.sgrid1.Cells[1,1]:='样板';
   for i:=1 to dbgrid1.FieldCount do
   begin
     item:=TmenuItem.Create(self);
     item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
     if dbgrid1.Columns[i-1].Visible then
      item.Checked:=true;
     item.OnClick := item_click;
     self.PopupMenu2.Items.Add(item);
   end;
   with dm.adoquery4 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    user_ptr:=fieldbyname('employee_ptr').asstring;
   end;
 end;
end;

procedure tform1.item_click(sender:TObject);
var i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADs25.IndexFieldNames) then
 dm.ADs25.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (PreColumn<>column) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADs25.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADs25.filter := '';
end;

procedure TForm1.N10Click(Sender: TObject);
var
i,rkey0025:integer;
node:ttreenode;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
TreeView1.Items.Clear;
self.get_treedate(dm.ADS25rkey.Value,treeview1);
node:=TreeView1.Items.Item[0];
rkey0025:=0;
for i:=0 to TreeView1.Items.Count-1 do
begin
TreeView1.Select(node);
dm.ADO31.Close;
dm.ADO31.Parameters[0].Value:=Pinteger(TreeView1.Items.Item[i].data)^;
dm.ADO31.Open;
if dm.ADO31.IsEmpty then
begin
rkey0025:=Pinteger(TreeView1.Items.Item[i].data)^;
break;
end;
end;
if rkey0025<>0 then
begin
with dm.ADOQuery1 do
begin
close;
sql.Text:='select MANU_PART_NUMBER from data0025 where rkey='+inttostr(rkey0025);
open;
end;
showmessage('产品'+dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString+'还没有品质跟踪信息！');
end
else
begin                              
dm.AQY0025.Close;
dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
dm.AQY0025.Open;
dm.AQY0025.Edit;
dm.AQY0025quality_status.Value:=true;
dm.AQY0025quality_user.Value:=strtoint(user_ptr);
dm.AQY0025quality_date.Value:=common.getsystem_date(dm.ADOQuery1,0);
dm.AQY0025.Post;
BitBtn3Click(Sender);
showmessage('产品品质跟踪信息提交成功！');
end;
end;
end;

function TForm1.get_date0025toprkey(rkey25: integer):integer;
var
 rkey:integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey25);
  open;
  rkey := fieldbyname('parent_ptr').AsInteger; //等于父值
 end;

 if rkey <= 0 then
  rkey:=rkey25       //如果产品顶层等于自己
 else
  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
   open;
   if FieldByName('parent_ptr').AsInteger > 0 then
    begin
     rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
     with dm.ADOQuery3 do
      begin
       close;
       sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
       open;
       if FieldByName('parent_ptr').AsInteger > 0 then
         rkey := fieldbyname('parent_ptr').AsInteger;  //如果有太公等于太公值
      end;
    end;
  end;
 result:=rkey;
end;

procedure TForm1.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  while not dm.ADOQuery1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dm.ADOQuery1.fieldbyname('rkey').AsString;
     open;
     while not dm.ADOQuery2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;

       with dm.ADOQuery3 do
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  dm.ADOQuery2.fieldbyname('rkey').AsString;
         open;
         while not dm.ADOQuery3.Eof do
         begin
          new(rkey0025);
          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
          node:=treeview.Items.AddChildObject
           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
          node.ImageIndex := 3;
          node:=node.Parent;
          dm.ADOQuery3.Next;
         end;
        end;

      node:=node.Parent;
      dm.ADOQuery2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   dm.ADOQuery1.Next;
  end;
 end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS25.IsEmpty then
begin
  N9.Enabled:=false;
  N10.Enabled:=false;
end
else
begin
  N9.Enabled := True;
  N10.Enabled:=((N9.Enabled) and (dm.ADS25quality_status.Value=false));
end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i:byte;
begin
 form3.dtpk1.Date:=dm.ADs25.Parameters.ParamValues['dtpk1'];
 form3.dtpk2.Date:=dm.ADs25.Parameters.ParamValues['dtpk2'];
 if form3.ShowModal=mrok then
 begin

  sql_text.Delete(23);
  sql_text.Delete(23);

  case  form3.ComboBox2.ItemIndex of
  0:begin
    sql_text.Insert(23,'where data0025.CUSTPART_ENT_DATE >=:dtpk1 and');
    sql_text.Insert(24,'data0025.CUSTPART_ENT_DATE-1 <=:dtpk2 and');
    end;
  1:begin
    sql_text.Insert(23,'where data0025.LAST_MODIFIED_DATE >=:dtpk1 and');
    sql_text.Insert(24,'data0025.LAST_MODIFIED_DATE-1 <=:dtpk2 and');
    end;
  2:begin
    sql_text.Insert(23,'where data0025.AUDITED_DATE >=:dtpk1 and');
    sql_text.Insert(24,'data0025.AUDITED_DATE-1 <=:dtpk2 and');
    end;
  end;

  dm.ADs25.Close;
  dm.ADs25.CommandText:=sql_text.Text;
  for i:=1 to form3.SGrid1.RowCount-2 do
   dm.ADs25.CommandText:=dm.ADs25.CommandText+
   form3.SGrid1.Cells[2,i]+#13;
  dm.ADs25.Parameters.ParamByName('dtpk1').Value:=form3.dtpk1.Date;
  dm.ADs25.Parameters.ParamByName('dtpk2').Value:=form3.dtpk2.Date;
  dm.ADS25.Prepared;
  dm.ADs25.Open;
 end;
end;



procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=86) and (ssAlt in Shift) then
  ShowMessage(DM.ADS25.CommandText);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if strtoint(vprev)=1 then
  begin
   ShowMsg('对不起!您没有该程序的可写权限',1);
   exit;
  end;
//只有状态为：生产中，外发生产，待入仓，待分配的作业单才能打印。
  Frm_ProductMix := TFrm_ProductMix.Create(Application);

  if Frm_ProductMix.ShowModal=mrok then
  begin
    with Tfrm_ProcedureReport.Create(application) do
    begin
      TRY
        ads25.Close;
        ads25.Parameters.ParamValues['MANU_PART_NUMBER']:=
              DM.AQY0025MANU_PART_NUMBER.Value;
        ads25.Open;

        ppReport1.Reset;

        ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'wzpr031.rtm';
        ppReport1.Template.LoadFromFile;
        ppReport1.SaveAsTemplate:=false;

        ppreport1.Print;

      FINALLY
       Free;
      END;
    end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  try
    frm_ProcedureReport:=Tfrm_ProcedureReport.Create(Application);
    frm_ProcedureReport.ppReport1.Reset;
    frm_ProcedureReport.ppReport1.Template.FileName:=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'wzpr031.rtm';
    frm_ProcedureReport.ppReport1.Template.LoadFromFile;
    frm_ProcedureReport.ppReport1.SaveAsTemplate:=True;
    frm_ProcedureReport.ppDesigner1.ShowModal;
  finally
    frm_ProcedureReport.Free;
  end;
end;

end.
