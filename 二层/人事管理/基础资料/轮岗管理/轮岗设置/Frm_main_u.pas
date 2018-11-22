unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls,ADODB,UDM, Menus, StdCtrls,Buttons,
  ExtCtrls, ImgList,common, DBGridEh,DB;

type
  TFrm_main = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    tv_display: TTreeView;
    img_dept: TImageList;
    btn1: TButton;
    dbgrdh1: TDBGridEh;
    Label1: TLabel;
    Button2: TButton;
    Button1: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure CreateNode(ParentNode:TTreeNode;Query:TADOQuery);
    procedure CreateTree();
    procedure FormCreate(Sender: TObject);
    procedure tv_displayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
      k: integer;
      PreColumn: TColumnEh;
      field_name:string;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

{$R *.dfm}
procedure TFrm_main.CreateNode(ParentNode: TTreeNode;Query: TADOQuery);
var
ChildNode:TTreeNode; //孩子结点
NodeInfo:^Integer; //rkey
QueryTmp:TADOQuery;
begin
    QueryTmp:=TADOQuery.Create(Self);
    QueryTmp.Clone(Query);
    with QueryTmp do
    begin
      Filtered:=False;
      sort := 'departmentcode';
      Filter:= 'superior='+ IntToStr(Integer(ParentNode.Data^));
      Filtered:=true;
      
      while not Eof do
      begin
       New(NodeInfo);

       NodeInfo^:= FieldByName('rkey').AsInteger;
       ChildNode:=tv_display.Items.AddChildObject(ParentNode,FieldByName('departmentname').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
       childnode.ImageIndex:=0;
       CreateNode(ChildNode,Query); //递归
       Next;
      end;
      childnode.ImageIndex:=1;
      Free; //释放无用的query
    end;
end;

procedure TFrm_main.CreateTree();
var
BootNode:TTreeNode; //根结点
NodeInfo: ^Integer; //rkey
begin
tv_display.Items.Clear;

with DM.qry_dept do
  begin
    Close;
    Filtered:=False;
    Filter:='superior=0';
    Filtered:=True;
    Open;
    New(NodeInfo);
    NodeInfo^:= FieldByName('rkey').AsInteger;
    tv_display.Items.Clear;
    BootNode:=tv_display.Items.AddChildObject(nil,FieldByName('departmentname').AsString,NodeInfo); //添加根结点，并关联根结点信息
  end;

  CreateNode(BootNode,dm.qry_dept); //创建子树
  //tv_display.FullExpand; //展开所有树结点
  //tv_display.AutoExpand:=true;
  tv_display.ReadOnly:=true;
  //如果是1或3的权限，那么不允许用户拖动
  {if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  tv_display.DragMode:=dmManual else
  tv_display.DragMode:=dmAutomatic; }

end;
function isparent(child,parent:TTreeNode):Boolean;
var
  NodeTmp:TTreeNode;
begin
  NodeTmp:=child;
  while NodeTmp.Parent<>nil do
  begin
    if Integer(parent.Data^)=Integer(NodeTmp.Parent.Data^) then
      begin
        Result:=True;
        Exit;
      end;
    NodeTmp:=NodeTmp.Parent;
  end;
  Result:=False;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
if not App_init(dm.con_dept ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  //dm.ADOCon.Open;
  {  user_ptr := '3';
  vprev := '2';     }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

    dm.emp_trun_string_orginal := dm.ds1.CommandText;
    dm.con_dept.Open;
    dm.update_emp_trun.ExecSQL;
    CreateTree;
    DM.qry_dept.Sort :='departmentcode';
    k:=0;
    DM.ds1.Active := True;
    Label1.Caption := '记录条数:'+ IntToStr(DM.ds1.RecordCount);
    dbgrdh1.ReadOnly :=True;
    Button1.Enabled:=True;
    button2.Enabled:=False;
    Button4.Enabled := False;  
    label2.caption :=dbgrdh1.Columns[3].Title.Caption ;
    field_name := dbgrdh1.Columns[3].FieldName;
    PreColumn := dbgrdh1.Columns[3];
    dbgrdh1.Columns[3].Title.Color := clred ;
end;

procedure TFrm_main.tv_displayClick(Sender: TObject);
var
NodeSlt:TTreeNode;
sFilter_string : string;
begin
  //树的单击事件，得到rkey
  if tv_display.Selected<>nil then   //showmodal返回后树将不存在选中结点，此时取根结点
      NodeSlt:=tv_display.Selected
  else
      NodeSlt:=tv_display.Items[0];
  //ShowMessage(IntToStr(Integer(NodeSlt.Data^)));
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text := 'select  dbo.get_departments('+IntToStr(Integer(NodeSlt.Data^))+') as Filter_string ';
  dm.ADOTMP.Open;
  sFilter_string := DM.ADOTMP.FieldByName('Filter_string').AsString;
  dm.ds1.Active := false;
  dm.ds1.CommandText := dm.emp_trun_string_orginal+' and departmentid in '+ sFilter_string;
  dm.ds1.Active := true;
 //dm.ds1.Active:= False;
 // dm.ds1.Filter := ''
//DM.ds1.Filter:=' and departmentid in '+ sFilter_string;
//DM.ds1.Filtered:=true;
//DM.ds1.Filter:=' departmentid i ';
Label1.Caption := '记录条数:'+ IntToStr(DM.ds1.RecordCount);
dbgrdh1.ReadOnly :=True;
Button1.Enabled:=True;
button2.Enabled:=False;
Button4.Enabled := False;
end;

procedure TFrm_main.Button1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or  (strtoint(vprev)=3) then
    begin
    showmessage('你没有权限执行此操作');
    abort;
    end;
  Button2.Enabled:=True;
  Button4.Enabled:=True;
  Button1.Enabled:=False;
  tv_display.Enabled := False;
  dbgrdh1.ReadOnly := False;
  dbgrdh1.Columns[5].ReadOnly := False;
  dbgrdh1.Columns[7].ReadOnly := False;
  dbgrdh1.Columns[5].Title.Color := clBlue ;
  dbgrdh1.Columns[7].Title.Color := clBlue ;
end;

procedure TFrm_main.Button2Click(Sender: TObject);
begin
DM.ds1.UpdateBatch();
 tv_display.Enabled := true;
 Button1.Enabled := True;
 dbgrdh1.ReadOnly := true;
 ShowMessage('保存完毕');
 DM.ds1.Active := False;
 dm.ds1.Active := true;
 dbgrdh1.Columns[5].Title.Color := clBtnFace ;
 dbgrdh1.Columns[7].Title.Color := clBtnFace ;
 Button2.Enabled := false;
 Button4.Enabled := false;
end;

procedure TFrm_main.btn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TFrm_main.dbgrdh1TitleClick(Column: TColumnEh);
begin

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ds1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ds1.Sort:=Column.FieldName+' DESC';
  end; 
  //if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin

  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
 
end;

procedure TFrm_main.Button3Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrdh1,self.Caption);
end;

procedure TFrm_main.Button4Click(Sender: TObject);
begin
 DM.ds1.CancelBatch;
 tv_display.Enabled := true;
 Button1.Enabled := True;
 dbgrdh1.ReadOnly := true;
 ShowMessage('本次修改已取消');
 DM.ds1.Active := False;
 dm.ds1.Active := true;
 dbgrdh1.Columns[5].Title.Color := clBtnFace ;
 dbgrdh1.Columns[7].Title.Color := clBtnFace ;
 Button2.Enabled := false;
 Button4.Enabled := false;
end;

end.
