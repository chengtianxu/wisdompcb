unit copy_product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, ExtCtrls, StdCtrls, Buttons, DBCtrls, Menus,
  ImgList,Inifiles;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ImageList1: TImageList;
    rkey25: TLabel;
    target_rkey25: TLabel;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn5: TBitBtn;
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    program_ini:Tinifile; 
   procedure get_treedate(rkey25: integer;treeview:Ttreeview;database:string);
   function find_rkey25(rkey25:integer):boolean;
  public
    { Public declarations }
   link_database:string;
  end;

var
  Form3: TForm3;

implementation

uses damo, product_search, DB,common, ADODB;

{$R *.dfm}

procedure TForm3.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:integer;
begin
if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
 end;
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n1.Enabled := false;
  end
 else
  begin
   n1.Enabled := true;
  end;
end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:word;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  if stringgrid1.RowCount=2 then
  bitbtn2.Enabled:=false;
end;


procedure TForm3.get_treedate(rkey25: integer;treeview:Ttreeview;database:string);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from '+database+
             'dbo.data0025 where rkey='+inttostr(rkey25);
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
  sql.Text:='select rkey,MANU_PART_NUMBER from '+database+
             'dbo.data0025 where parent_ptr='+inttostr(rkey25);
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
     sql.Text:='select rkey,MANU_PART_NUMBER from '+database+
     'dbo.data0025 where parent_ptr='+dm.ADOQuery1.fieldbyname('rkey').AsString;
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
         sql.Text:='select rkey,MANU_PART_NUMBER from '+database+
         'dbo.data0025 where parent_ptr='+dm.ADOQuery2.fieldbyname('rkey').AsString;
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

end;

procedure TForm3.FormActivate(Sender: TObject);
var
 filename:string;

begin
 get_treedate(dm.ADS25rkey.Value,treeview1,'');
 stringgrid1.Cells[0,0]:='当前产品编号';
 stringgrid1.Cells[1,0]:='目标产品编号';
 stringgrid1.ColWidths[2]:=0;
 stringgrid1.ColWidths[3]:=0;
if combobox2.Enabled then
 begin
  filename:=Extractfilepath(ParamStr(0))+'WISDOMPCB.ini';
  program_ini:=Tinifile.Create(filename);
  program_ini.ReadSection('数据库',combobox2.Items);
 end;
end;

procedure TForm3.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 rkey25.Caption:=inttostr(Pinteger(Node.data)^);
 node.SelectedIndex:=4;
 if (strtoint(rkey25.Caption)>0) and
    (strtoint(target_rkey25.Caption)>0) then
  bitbtn1.Enabled:=true;
end;

procedure TForm3.TreeView2Change(Sender: TObject; Node: TTreeNode);
begin
 target_rkey25.Caption:=inttostr(Pinteger(Node.data)^);
 node.SelectedIndex:=4;
 if (strtoint(rkey25.Caption)>0) and
    (strtoint(target_rkey25.Caption)>0) then
  bitbtn1.Enabled:=true;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
 database:string;
begin
if bitbtn5.Enabled then
 if trim(edit2.Text)='' then
  begin
   showmsg('请首先确定数据库!',1);
   combobox2.SetFocus;
  end
 else
 try
  form_product:=tform_product.Create(application);
  database:= '['+edit2.Text+'].'+
   program_ini.ReadString('数据库',combobox2.Text,'')+'.';
  form_product.Caption:=combobox2.Text +':'+ form_product.Caption;

   form_product.adoquery1.Close;
   form_product.adoquery1.CommandText:=
  'SELECT data0025.rkey,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC, '+
  'Data0025.PROD_CODE_PTR,Data0025.CUSTOMER_PTR, '+
  'Data0025.PROD_ROUTE_PTR,Data0025.ONHOLD_SALES_FLAG,'+
  'Data0008.PRODUCT_NAME, Data0010.CUST_CODE,Data0025.LAYERS, '+
  'case Data0025.ttype '+
  'when 0 then ''量产'' when 1 then ''样板''  end as batch_or_former '+
  'FROM '+database+'dbo.Data0008 INNER JOIN '+
         database+'dbo.Data0025 ON '+
        'Data0008.RKEY =Data0025.PROD_CODE_PTR INNER JOIN '+
         database+
        'dbo.Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+
  'where Data0025.MANU_PART_NUMBER like '+quotedstr(edit1.Text+'%')+
  ' and  data0025.PARENT_PTR is null ';
   form_product.adoquery1.Open;

 if form_product.adoquery1.IsEmpty then
  BEGIN
   messagedlg('没有找到需要复制的产品',mtinformation,[mbcancel],0);
   EDIT1.SetFocus;
  END
 else
 if form_product.ShowModal=mrok then
 begin
  edit1.Text:=form_product.adoquery1MANU_PART_NUMBER.Value;
  label4.Caption:=form_product.adoquery1MANU_PART_DESC.Value;
  treeview2.Items.Clear;
  get_treedate(form_product.adoquery1rkey.Value,treeview2,database);
  self.target_rkey25.Caption:='0';
  link_database:=database;
  if combobox2.Enabled then combobox2.Enabled:=false;
  if bitbtn1.Enabled then bitbtn1.Enabled:=false;
 end
 else
  edit1.SetFocus;
 finally
  form_product.Free;
 end

else       //本机联系
 try
 form_product:=tform_product.Create(application);
 form_product.adoquery1.Close;
 form_product.adoquery1.CommandText:=form_product.adoquery1.CommandText+
 '        and  data0025.PARENT_PTR is null ';
 form_product.adoquery1.Parameters[0].Value:=edit1.Text+'%';
 form_product.adoquery1.Open;
 if form_product.adoquery1.IsEmpty then
  BEGIN
   messagedlg('没有找到需要复制的产品',mtinformation,[mbcancel],0);
   EDIT1.SetFocus;
  END
 else
 if form_product.ShowModal=mrok then
 begin
  edit1.Text:=form_product.adoquery1MANU_PART_NUMBER.Value;
  label4.Caption:=form_product.adoquery1MANU_PART_DESC.Value;
  treeview2.Items.Clear;
  get_treedate(form_product.adoquery1rkey.Value,treeview2,'');
  self.target_rkey25.Caption:='0';
  link_database:='';
  if bitbtn1.Enabled then bitbtn1.Enabled:=false;
 end
 else
  edit1.SetFocus;
 finally
  form_product.Free;
 end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
 node:ttreenode;   //treeview控件的节点变量
begin
 if not self.find_rkey25(strtoint(rkey25.Caption)) then
 begin
   node:=treeview1.Selected;
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=node.Text;
   stringgrid1.Cells[2,stringgrid1.RowCount-1]:=self.rkey25.Caption;
   node:=treeview2.Selected;
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=node.Text;
   stringgrid1.Cells[3,stringgrid1.RowCount-1]:=self.target_rkey25.Caption;
   stringgrid1.RowCount:=stringgrid1.RowCount+1;
   bitbtn1.Enabled:=false;
   bitbtn2.Enabled:=true;
 end
 else
  messagedlg('需要复制的线路层已经有对应目标线路层',MTERROR,[mbcancel],0);
end;

procedure TForm3.Edit1Exit(Sender: TObject);
var
 database:string;
begin
if (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)<>'') then
begin
 if bitbtn5.Enabled then
  database:='['+edit2.Text+'].'+program_ini.ReadString('数据库',combobox2.Text,'')+'.'
 else
  database:='';

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT rkey,MANU_PART_DESC from '+database+'dbo.data0025'+#13+
            'where PARENT_PTR is null and'+#13+
            'MANU_PART_NUMBER='''+trim(edit1.Text)+'''';
  open;
  if isempty then
   begin
    edit1.SetFocus;
    messagedlg('本厂编号输入错误!',mtinformation,[mbcancel],0);
   end
  else
   begin
    label4.Caption:=fieldbyname('MANU_PART_DESC').AsString;
    treeview2.Items.Clear;
    get_treedate(fieldvalues['rkey'],treeview2,database);
    self.target_rkey25.Caption:='0';
    link_database:=database;
    if combobox2.Enabled then combobox2.Enabled:=false;
    if bitbtn1.Enabled then bitbtn1.Enabled:=false;
   end;
 end;
end
else
if (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)='') then
 begin
  treeview2.Items.Clear;
  self.target_rkey25.Caption:='0';
  label4.Caption:='';
  combobox2.Enabled:=true;
 end;
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then treeview2.SetFocus;

end;

function TForm3.find_rkey25(rkey25: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stringgrid1.RowCount-2 do
 if strtoint(stringgrid1.Cells[2,i])=rkey25 then
 begin
  result:=true;
  break;
 end;
end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
edit2.Text:=program_ini.ReadString('服务器',combobox2.Text,'');
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
if combobox2.ItemIndex>=0 then
with dm.ADOQuery4 do
 begin
  close;
  sql.Text:='select * from sys.servers where name='+quotedstr(edit2.Text);
  open;
  if IsEmpty then
   with dm.ADOQuery3 do
    begin
     close;
     sql.Text:='exec sp_addlinkedserver '+quotedstr(edit2.Text);
     try
      ExecSQL;
      showmsg('注册成功!',1);
     except
       messagedlg('注册不成功,请与管理员联系!',mterror,[mbcancel],0);
     end;
    end
  else
   showmsg('数据库'''+combobox2.Text+'''已经在当前数据库中注册!',1);
 end
else
 showmsg('请首先选择数据库',1);
end;

procedure TForm3.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (combobox2.Enabled) and (edit2.Text='') then
 begin
  edit1.Text:='';
  combobox2.SetFocus;
  showmsg('请首先确定数据库!',1);
 end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if bitbtn5.Enabled then
 begin
 for i:=1 to StringGrid1.RowCount-2 do
  begin
   with dm.ADOQuery1 do      //全局参数
   begin
    close;
    sql.Text:='select d1.PARAMETER_NAME from data0278 right outer join'+#13+
       '(select data0278.PARAMETER_NAME'+#13+
      'from '+link_database+'dbo.data0279 inner join '+
       link_database+'dbo.data0278'+#13+
      'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
      'where data0279.IES_PROD=1 and'+#13+
      'data0279.source_ptr='+StringGrid1.Cells[3,i]+') as d1'+#13+
      'on data0278.PARAMETER_NAME=d1.PARAMETER_NAME'+#13+
      'where data0278.PARAMETER_NAME is null';
    open;
   end;
   if not dm.ADOQuery1.IsEmpty then
   begin
    showmsg('对方数据库的全局参数:'+dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString+
            '在本厂未定义,复制操作不能进行,请与管理员联系!',1);
    exit;
   end;

   with dm.ADOQuery1 do      //工序代码
   begin
    close;
    sql.Text:='select d1.DEPT_CODE from data0034 right outer join'+#13+
       '(select distinct data0034.DEPT_CODE'+#13+
      'from '+link_database+'dbo.data0038 inner join '+
       link_database+'dbo.data0034'+#13+
      'on data0038.DEPT_PTR=data0034.rkey'+#13+
      'where data0038.source_ptr='+StringGrid1.Cells[3,i]+') as d1'+#13+
      'on data0034.DEPT_CODE=d1.DEPT_CODE'+#13+
      'where data0034.DEPT_CODE is null';
    open;
   end;
  if not dm.ADOQuery1.IsEmpty then
   begin
    showmsg('对方数据库的工序代码:'+dm.ADOQuery1.fieldbyname('DEPT_CODE').AsString+
    '在本厂未定义复制操作不能进行,请与管理员联系!',1);
    exit;
   end;

   with dm.ADOQuery1 do      //制程参数
   begin
    close;
    sql.Text:='select d1.PARAMETER_NAME from data0278 right outer join'+#13+
       '(select distinct data0278.PARAMETER_NAME'+#13+
      'from '+link_database+'dbo.data0494 inner join '+
       link_database+'dbo.data0278'+#13+
      'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
      'where Data0494.custpart_ptr='+StringGrid1.Cells[3,i]+') as d1'+#13+
      'on data0278.PARAMETER_NAME=d1.PARAMETER_NAME'+#13+
      'where data0278.PARAMETER_NAME is null';
    open;
   end;
   if not dm.ADOQuery1.IsEmpty then
   begin
    showmsg('对方数据库的制程:'+dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString+
    '在本厂未定义复制操作不能进行,请与管理员联系!',1);
    exit;
   end;
  end;

  self.ModalResult:=mrok;
 end
else
  self.ModalResult:=mrok;

end;

end.
