unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    TabSheet2: TTabSheet;
    Tabsheet1: TTabSheet;
    PageControl1: TPageControl;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid2: TDBGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, dig_add,dig_edit,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
  newstring:string;
  ClickedOK: Boolean;
begin
  ClickedOK :=InputQuery('摘要类别增加', ' 摘要： ',newstring);
  if ClickedOK and (length(trim(newstring))>0) then
    begin
    dm.ADOQuery1.Append;
    dm.ADOQuery1.FieldByName('DICT_GRP').AsString:=trim(newstring);
    dm.ADOQuery1.Post;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
 var
  newstring:string;
  ClickedOK: Boolean;
begin
 if not dm.ADOQuery1.IsEmpty then
 begin
   newstring:=dm.ADOQuery1.fieldbyname('DICT_GRP').AsString;
   ClickedOK :=InputQuery('摘要类别编辑', '摘要：',newstring);
   if ClickedOK and (length(trim(newstring))>0) then
    begin
    dm.ADOQuery1.Edit;
    dm.ADOQuery1.FieldByName('DICT_GRP').AsString:=trim(newstring);
    dm.ADOQuery1.Post;
    end;
   end
  else
   messagedlg('数据集为空,无法进行编辑',mtwarning,[mbok],0);
end;


procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
if not dm.ADOQuery1.IsEmpty then
 begin
 if messagedlg('确认要删除该摘要类别吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 begin
 dm.ADOConnection1.BeginTrans;
 try
  DM.ADOQ.Close;
  DM.ADOQ.SQL.Clear;
  DM.ADOQ.SQL.Add('select * from data0513');
  dm.ADOQ.SQL.Add('where GRP_PTR='+dm.ADOQuery1.fieldbyname('rkey').AsString);
  dm.ADOQ.Open;
  for i:=1 to dm.ADOQ.RecordCount do
  if not dm.ADOQ.IsEmpty then
  dm.ADOQ.Delete;
  dm.adoquery1.delete ;
  dm.ADOConnection1.CommitTrans;
  messagedlg('数据删除成功！',mtinformation,[mbok],0);
 except
  on e: exception  do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(e.message,mterror,[mbcancel],0);
   end;
  end;
 end;
end
else
 messagedlg('数据删除失败,请查看数据集是否为空!',mtwarning,[mbok],0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var vrecn:integer;
begin
 Application.CreateForm(TForm_add, Form_add);
 form_add.ComboBox1.Items.Clear;
 vrecn:=dm.ADOQuery1.RecNo;
 dm.ADOQuery1.DisableControls;
 dm.ADOQuery1.First;
 with dm.ADOQuery1 do
  while not eof do
  begin
   form_add.ComboBox1.Items.Add(FieldValues['DICT_GRP']);
   next;
  end;
  dm.ADOQuery1.MoveBy(vrecn-dm.ADOQuery1.RecNo);
  form_add.ComboBox1.ItemIndex:=dm.ADOQuery1.RecNo-1;
  //showmessage(inttostr(form_add.ComboBox1.ItemIndex));
  dm.ADOQuery1.EnableControls;
  form_add.ShowModal;
  form_add.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
var vrecn,vrecn2:integer;
begin
 if not dm.ADOQuery2.IsEmpty then
 begin
  application.CreateForm(tform_edit,form_edit);
  form_edit.ComboBox1.Items.Clear;
  vrecn:=dm.ADOQuery1.RecNo;
  vrecn2:=dm.ADOQuery2.RecNo;
  dm.ADOQuery1.DisableControls;
  dm.ADOQuery1.First;
  with dm.ADOQuery1 do
  while not eof do
   begin
    form_edit.ComboBox1.Items.Add(FieldValues['DICT_GRP']);
    next;
    end;
  dm.ADOQuery1.MoveBy(vrecn-dm.ADOQuery1.RecNo);
  dm.ADOQuery1.EnableControls;
  dm.ADOQuery2.MoveBy(vrecn2-dm.ADOQuery2.RecNo);
  form_edit.Edit1.Text:=trim(dm.ADOQuery2.FieldValues['description']);
  form_edit.ComboBox1.ItemIndex:=dm.ADOQuery1.RecNo-1;
  form_edit.ComboBox1.Enabled:=false;
  form_edit.ShowModal;
  form_edit.Free;
  end
 else
  messagedlg('数据集为空,无法进行编辑!',mtwarning,[mbok],0);
end;


procedure TForm1.Button6Click(Sender: TObject);
begin
if not dm.ADOQuery2.IsEmpty then
 begin
  if messagedlg('确认要删除该摘要吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  dm.ADOQuery2.Delete;
 end
  else
  messagedlg('数据删除失败,请查看数据集是否为空!',mtwarning,[mbok],0);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

if (trim(vprev)='1') or
    (trim(vprev)='3') then
  begin
    Button1.Enabled:=false;
    Button2.Enabled:=false;
    Button3.Enabled:=false;
    Button4.Enabled:=false;
    Button5.Enabled:=false;
    Button6.Enabled:=false;
  end;

dm.ADOQuery1.Open;
dm.ADOQuery2.Open;
end;

end .


