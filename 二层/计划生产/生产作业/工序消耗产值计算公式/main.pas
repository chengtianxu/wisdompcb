unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DAMO,common, formula,MyClass;

{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS569.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dm.ADS569.filter := '';
end;

procedure tform1.item_click(sender:TObject);
var i:byte;
begin
 (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
 if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGrid1.FieldCount-1 do
  if DBGrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGrid1.Columns[i].Visible:=true;
    break;
   end;
 end
 else begin
  for i:=0 to DBGrid1.FieldCount-1 do
  if DBGrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
 item:TMenuItem;

begin
 if  dm.ADOConnection.Connected then
 begin
  dm.ADS569.Close;
  dm.ADS569.Open;
  PreColumn := DBGrid1.Columns[0];
  for i:=1 to DBGrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrid1.Columns[i-1].Title.Caption ;
    if DBGrid1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
  MyDataClass :=TMyDataClass.Create(DM.ADOConnection);
  Formula_Verify := TFormula_Verify.Create(DM.ADOConnection);
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey: string;
begin
v_rkey := '';
if not dm.ADS569.IsEmpty then  v_rkey := dm.ADS569formula_number.Value;
 dm.ADS569.Close;
 dm.ADS569.Open;
if v_rkey <> '' then  dm.ADS569.Locate('formula_number',v_rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(Self.DBGrid1,self.Caption);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (PreColumn.FieldName<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
  dm.ADS569.IndexFieldNames:=column.FieldName;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS569.CommandText);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
 try
  Form_formula := TForm_formula.Create(application);
  with Form_formula do
  begin
   cbb_ttype.ItemIndex:=0;  //类型为物料消耗
   ad_ed:=0; //新增
  end;
  if Form_formula.ShowModal = mrok then
   begin
    DM.ADS569.Close;
    DM.ADS569.Open;
    dm.ADS569.Locate('formula_number',dm.ADOQuery1.fieldbyname('formula_number').AsString,[]);
   end;
 finally
  Form_formula.free;
  dm.ADOQuery1.Close;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
 try
  Form_formula := TForm_formula.Create(application);
  with Form_formula do
  begin
   cbb_ttype.ItemIndex:=1;  //类型为产值统计
   ad_ed:=0; //新增
   rb2.Enabled:=false;
   rb3.Enabled:=False;
   rb4.Enabled:=False;
  end;
  if Form_formula.ShowModal = mrok then
   begin
    DM.ADS569.Close;
    DM.ADS569.Open;
    dm.ADS569.Locate('formula_number',dm.ADOQuery1.fieldbyname('formula_number').AsString,[]);
   end;
 finally
  Form_formula.free;
  dm.ADOQuery1.Close;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 try
  Form_formula := TForm_formula.Create(application);
  with Form_formula do
  begin
   cbb_ttype.ItemIndex:= cbb_ttype.Items.IndexOf(dm.ADS569v_type.Value);
   ad_ed:=2; //检查
   BitSve.Enabled:=False;
   formula_number.ReadOnly:=true;
   Edit1.Enabled:=False;
   Panel1.Enabled:=false;
   edt_para0.Enabled:=False;
   edt_para1.Enabled:=False;
   edt_para2.Enabled:=False;
   edt_para3.Enabled:=False;
   edt_para4.Enabled:=False;
   edt_para5.Enabled:=False;
   edt_para6.Enabled:=False;
   edt_para7.Enabled:=False;
   edt_para8.Enabled:=False;
   edt_para9.Enabled:=False;
   BitBtn1.Enabled:=False;
   BitBtn2.Enabled:=False;
   BitBtn3.Enabled:=False;
   BitBtn4.Enabled:=False;
   BitBtn5.Enabled:=False;
   BitBtn6.Enabled:=False;
   BitBtn7.Enabled:=False;
   BitBtn8.Enabled:=False;
   BitBtn9.Enabled:=False;
   BitBtn10.Enabled:=False;
   BitBtn11.Enabled:=False;
   Memo1.Enabled:=False;
   rb1.Enabled:=false;   
   rb2.Enabled:=false;
   rb3.Enabled:=False;
   rb4.Enabled:=False;
  end;
  if Form_formula.ShowModal = mrok then
   begin
   end;
 finally
  Form_formula.free;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
 try
  Form_formula := TForm_formula.Create(application);
  with Form_formula do
  begin
   cbb_ttype.ItemIndex:= cbb_ttype.Items.IndexOf(dm.ADS569v_type.Value);
   ad_ed:=1; //编辑
   if cbb_ttype.ItemIndex=1 then
    begin
     rb2.Enabled:=false;
     rb3.Enabled:=False;
     rb4.Enabled:=False;
    end;
  end;
  if Form_formula.ShowModal = mrok then
   begin
    DM.ADS569.Close;
    DM.ADS569.Open;
    dm.ADS569.Locate('formula_number',dm.ADOQuery1.fieldbyname('formula_number').AsString,[]);
   end;
 finally
  Form_formula.free;
  dm.ADOQuery1.Close;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
 if messagedlg('确认要删除该条记录吗?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  try
  with dm.ADOQuery1 do
  begin
   Close;
   sql.Text:='delete data0569 where formula_number='+
             quotedstr(dm.ADS569formula_number.Value);
   ExecSQL;
  end;
  messagedlg('删除操作成功',mtinformation,[mbok],0);
  BitBtn3Click(sender);
  except
  on E: Exception do
   begin
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection) then
 begin
   ShowMsg('程序启动失败，请与系统管理员联系！','提示',1);
   application.Terminate;
   exit;
 end;  

 //vprev:='4';
 //rkey73:='782';
 //dm.ADOConnection1.Open;
 
 self.Caption:=application.title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS569.IsEmpty then
 begin
  n2.Enabled:=false;
  N3.Enabled:=false;
  N6.Enabled:=False;
 end
else
 begin
  n2.Enabled:=True;
  N3.Enabled:=True;
  N6.Enabled:=True;
 end;
end;

end.
