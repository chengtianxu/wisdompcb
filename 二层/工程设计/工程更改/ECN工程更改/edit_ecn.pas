unit edit_ecn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, ImgList,
  Grids, DBGridEh, DBGrids, Menus;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn15: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    Label4: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit1: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit7: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    TabSheet3: TTabSheet;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    DBMemo3: TDBMemo;
    SpeedButton1: TSpeedButton;
    TreeView2: TTreeView;
    HeaderControl2: THeaderControl;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    rkey25: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Edit8: TEdit;
    Edit9: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure TreeView2Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
   Modified_38,Modified_06:boolean; 
   procedure get_treedate(rkey25: integer;treeview:Ttreeview);
   procedure update06_log();    
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses DAMO, main,common, deptcode_search, ECN_report;

{$R *.dfm}

procedure TForm3.update06_log;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='SELECT SOURCE_PTR, SOURCE_TYPE, EMPL_PTR, TDATE, [ACTION], Remark'+#13+
           'FROM Data0117'+#13+
           'where rkey is null';
 open;
end;

dm.ads06.DisableControls;
dm.ads06.First;
dm.ads_clone06.First;
while not dm.ads06.Eof do
 begin
  if dm.ads06prod_status.Value<>dm.ads_clone06prod_status.Value then
  begin
   if (dm.ads_clone06prod_status.Value=2) or
      (dm.ads_clone06prod_status.Value=3) then
    dm.ADOQuery1.AppendRecord([dm.ads06RKEY.Value,2,
                          strtoint(user_ptr),
                          getsystem_date(dm.adoquery2,0),
                          1,'ECN升级暂停生产'])
   else
    dm.ADOQuery1.AppendRecord([dm.ads06RKEY.Value,2,
                          strtoint(user_ptr),
                          getsystem_date(dm.adoquery2,0),
                          2,'ECN升级恢复生产']);

  end;

  dm.ads06.Next;
  dm.ads_clone06.Next;
 end;

dm.ads06.EnableControls;
end;


procedure TForm3.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
 LNodeArr:array of TTreeNode;
 i,j:Integer;
begin

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:=' ;with CTE(rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,lv) as    ' + #13+
              '(    ' + #13+
              '  select rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,0  '+ #13+
              '  from data0025 where rkey='+inttostr(rkey25) + #13+
              '  UNION ALL  '+ #13+
              '  select d25.rkey,d25.PARENT_PTR,d25.MANU_PART_NUMBER,d25.qty_bom,d25.shelf_life,d25.analysis_code_3,d25.ttype,d25.QTY_PARENTBOM,d25.OPT_LOT_SIZE,cte.lv+1 ' + #13+
              '  from data0025 d25 INNER JOIN CTE on	d25.parent_ptr=CTE.rkey ' + #13+
              ')  ' + #13+
              ' select * from CTE order by lv ';
//    ShowMessage(SQL.Text);
       open;
    if not IsEmpty then
    begin
      j:=0;
      while not Eof do
      begin
        new(rkey0025);
        rkey0025^ := fieldvalues['rkey'];
        if fieldbyname('PARENT_PTR').AsInteger = 0 then
          node := treeview.Items.AddObject
          (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025) //增加顶层节点
        else
        begin
          for i:=0 to Length(LNodeArr)-1 do
          begin
            if Integer(LNodeArr[i].data^) = fieldbyname('PARENT_PTR').AsInteger  then
            begin
              node := treeview.Items.AddChildObject
              (LNodeArr[i],fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
              Break;
            end;
          end;
        end;
        SetLength(LNodeArr,Length(LNodeArr) + 1);
        LNodeArr[j]:= node;
        j:=j + 1;
        node.ImageIndex:= fieldbyname('lv').AsInteger;  //为节点定义图画
        Next;
      end;
    end;
  end;

//
//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
//              inttostr(rkey25);
//  open;
//  new(rkey0025);
//  rkey0025^:=fieldvalues['rkey'];
//  node:=treeview.Items.AddObject
//  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
//  node.ImageIndex:=0;  //为第一层节点定义图画
// end;
//
//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              inttostr(rkey25);
//  open;
//  while not dm.ADOQuery1.Eof do
//  begin
//   new(rkey0025);
//   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
//   node:=treeview.Items.AddChildObject
//      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//   node.ImageIndex := 1;
//   with dm.ADOQuery2 do
//    begin
//     close;
//     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              dm.ADOQuery1.fieldbyname('rkey').AsString;
//     open;
//     while not dm.ADOQuery2.Eof do
//     begin
//      new(rkey0025);
//      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
//      node:=treeview.Items.AddChildObject
//       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//      node.ImageIndex := 2;
//       with dm.ADOQuery3 do
//        begin
//         close;
//         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//                  dm.ADOQuery2.fieldbyname('rkey').AsString;
//         open;
//         while not dm.ADOQuery3.Eof do
//         begin
//          new(rkey0025);
//          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
//          node:=treeview.Items.AddChildObject
//           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//          node.ImageIndex := 3;
//          node:=node.Parent;
//          dm.ADOQuery3.Next;
//         end;
//        end;
//      node:=node.Parent;
//      dm.ADOQuery2.Next;
//     end;
//    end;
//   node:=node.Parent; //节点指向其父节点值
//   dm.ADOQuery1.Next;
//  end;
// end;
 treeview.FullExpand; //全部展开
end;

procedure TForm3.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if trim(dm.ads_ed38tool_old_rev.Value)<>'' then
 begin
  DBGrideh1.Canvas.Font.Color := clred;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:=
'SELECT Data0005.EMPLOYEE_NAME, Data0005_1.EMPLOYEE_NAME AS edit_name,'+#13+
 ' Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,'+#13+
 ' Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'+#13+
 ' Data0025_1.MANU_PART_NUMBER AS part_number,'+#13+
 ' Data0025.ANALYSIS_CODE_2,'+#13+//
 ' Data0025_1.ANALYSIS_CODE_2 AS CODE_2,'+#13+       //
 ' Data0025_1.MANU_PART_DESC AS part_desc'+#13+
'FROM Data0005 INNER JOIN'+#13+
 ' Data0273 ON Data0005.RKEY = Data0273.ENTERED_BY INNER JOIN'+#13+
 ' Data0010 ON Data0273.CUSTOMER_PTR = Data0010.RKEY INNER JOIN'+#13+
 ' Data0025 ON'+#13+
 ' Data0273.COPYFROMCUST_PTR = Data0025.RKEY INNER JOIN'+#13+
 ' Data0025 Data0025_1 ON'+#13+
 ' Data0273.CUSTOMER_PART_PTR = Data0025_1.RKEY LEFT OUTER JOIN'+#13+
 ' Data0005 Data0005_1 ON Data0273.last_modi_by_ptr = Data0005_1.RKEY'+#13+
 'where data0273.rkey='+dm.adsa273RKEY.AsString;
 open;
 edit1.Text:=fieldbyname('CUST_CODE').AsString;
 edit3.Text:=fieldbyname('MANU_PART_NUMBER').AsString;
 edit4.Text:=fieldbyname('MANU_PART_DESC').AsString;
 edit5.Text:=fieldbyname('part_number').AsString;
 edit6.Text:=fieldbyname('part_desc').AsString;
 edit2.Text:=fieldbyname('EMPLOYEE_NAME').AsString;
 edit7.Text:=fieldbyname('edit_name').AsString;
 Edit8.Text:=fieldbyname('ANALYSIS_CODE_2').AsString;
 Edit9.Text:=fieldbyname('CODE_2').AsString;
end;

Self.get_treedate(dm.adsa273CUSTOMER_PART_PTR.Value,treeview1);
treeview1.Items[0].Selected:=true;
Self.get_treedate(dm.adsa273COPYFROMCUST_PTR.Value,treeview2);
treeview2.Items[0].Selected:=true;
pagecontrol1.ActivePageIndex:=0;
end;

procedure TForm3.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  node.SelectedIndex:=4;
  dm.ads_ed38.Close;
  dm.ads_ed38.Parameters[0].Value:=Pinteger(node.Data)^;
  dm.ads_ed38.Open;
  rkey25.Caption := inttostr(Pinteger(node.Data)^);
  modified_38:=false;
end;

procedure TForm3.TreeView1Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
 if Modified_38 then
 if messagedlg('变换线路层,要保存工序版本变更值吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  DM.ads_ed38.UpdateBatch();
end;

procedure TForm3.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.ADS_ed38.RecNo=dm.ADS_ed38.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
self.Modified_38:=true;
end;

procedure TForm3.BitBtn11Click(Sender: TObject);
begin
 dm.ADOConnection1.BeginTrans;
 try
  dm.adsa273last_modi_by_ptr.Value:=strtoint(user_ptr);
  dm.adsa273last_modi_date.Value:=getsystem_date(dm.adoquery1,0);
  dm.adsa273.Post;
  DM.adsa273.Refresh;
  dm.adsa273.Edit;

  with dm.adoquery1 do
  begin
  close;
  sql.text:=
   'select data0005.employee_name as edit_name'+#13+
   'from data0005 inner join'+#13+
   ' data0273 on data0005.rkey = data0273.last_modi_by_ptr'+#13+
   'where data0273.rkey='+dm.adsa273rkey.asstring;
  open;
  edit7.text:=fieldbyname('edit_name').asstring;
  end;

  DM.ads_ed38.UpdateBatch();

  dm.ads06.UpdateBatch();
  self.update06_log;

  dm.ADOConnection1.CommitTrans;
  modified_38:=false;
  Modified_06:=false;
 except
  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var
 i:integer;
begin
form_deptcode := tform_deptcode.Create(application);
if form_deptcode.ShowModal=mrok then
 begin
  with form_deptcode do
   for i:=1 to stringgrid1.RowCount-1 do
    if strtoint(stringgrid1.Cells[3,i])=1 then
     dm.adsa273TEXT4.Value:=dm.adsa273TEXT4.Value+'  '+
                     trim(stringgrid1.Cells[1,i]);
 end;
form_deptcode.Free;
end;

procedure TForm3.TreeView2Change(Sender: TObject; Node: TTreeNode);
begin
node.SelectedIndex:=4;
dm.ads06.Close;
dm.ads06.Parameters[0].Value:=Pinteger(node.Data)^;
dm.ads06.Open;
dm.ads_clone06.Close;
dm.ads_clone06.Parameters[0].Value:=Pinteger(node.Data)^;
dm.ads_clone06.Open;
modified_06:=false;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ads06.CommandText)
end;

procedure TForm3.N1Click(Sender: TObject);
begin
 dm.ads06.Edit;
 IF dm.ads06prod_status.Value=2 then
  dm.ads06prod_status.Value:=102
 else
  dm.ads06prod_status.Value:=103;
 dm.ads06.Post;
 Modified_06:=true;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
 dm.ads06.Edit;
 IF dm.ads06prod_status.Value=102 then
  dm.ads06prod_status.Value:=2
 else
  dm.ads06prod_status.Value:=3;
 dm.ads06.Post;
 Modified_06:=true;
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
if (dm.ads06prod_status.Value=2) or
   (dm.ads06prod_status.Value=3) then
 begin
  n1.Enabled:=true;
  n2.Enabled:=false;
 end
else
if (dm.ads06prod_status.Value=102) or
   (dm.ads06prod_status.Value=103) then
 begin
  n1.Enabled:=false;
  n2.Enabled:=true;
 end
else
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 end
end;

procedure TForm3.TreeView2Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
 if Modified_06 then
 if messagedlg('变换线路层,要保存作业单变更吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  DM.ads06.UpdateBatch();
  self.update06_log;
 end;
end;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if dm.ads_ed38.Active then
 dm.ads_ed38.Close;
 if dm.ads06.Active then
 dm.ads06.Close;
 if dm.ads_clone06.Active then
 dm.ads_clone06.Close;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
dm.ADOConnection1.BeginTrans;
try
  dm.adsa273last_modi_by_ptr.Value:=strtoint(user_ptr);
  dm.adsa273last_modi_date.Value:=getsystem_date(dm.adoquery1,0);
  dm.adsa273.Post;

  DM.ads_ed38.UpdateBatch();
  dm.ads06.UpdateBatch();
  self.update06_log;
  dm.ADOConnection1.CommitTrans;
  self.ModalResult:=mrok;
 except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;
end;

procedure TForm3.BitBtn15Click(Sender: TObject);
begin
form_report:=tform_report.Create(application);
 form_report.ads273.Close;
 form_report.ads273.Parameters[0].Value:=dm.adsa273RKEY.Value;
 form_report.ads273.Open;

 form_report.ads_ed38.Close;
 form_report.ads_ed38.Parameters[0].Value:=strtoint(rkey25.Caption);
 form_report.ads_ed38.Open;


 form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
   stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
     'ECN_Report.rtm';
 form_report.ppReport1.Template.LoadFromFile;
 form_report.ppReport1.SaveAsTemplate:=false;

form_report.ppReport1.Print;
form_report.Free;
end;

end.
