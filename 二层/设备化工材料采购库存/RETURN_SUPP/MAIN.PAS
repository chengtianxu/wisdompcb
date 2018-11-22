unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, DB, ADODB,
  Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    csi_rkey: TLabel;
    db_ptr: TLabel;
    vprev: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
  public
    { Public declarations }
    empl_ptr:integer;
    sys_longdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation
 USES DAMO, po_search, return_quan, return_insp;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 form2 := tform2.Create(application);
 form2.Edit1.Text := trim(edit1.Text);
 if form2.AQ70.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form2.ShowModal = mrok then
  begin
   edit1.Text := form2.AQ70PO_NUMBER.Value;
   edit1.Font.Color := clwindowtext;
   edit2.Text := form2.AQ70CODE.Value;
   label10.Caption := form2.AQ70SUPPLIER_NAME.Value;
   edit3.Text := form2.AQ70WAREHOUSE_CODE.Value;
   label11.Caption := form2.AQ70WAREHOUSE_NAME.Value;
   edit4.Text := form2.AQ70FACTORY_LOCATION.Value;
   edit5.Text := form2.AQ70PO_DATE.AsString;
   edit6.Text := form2.AQ70CONFIRMATION_NUMBER.Value;
   with dm.AQ71 do
    begin
     close;
     dm.AQ71.Parameters[0].Value := form2.AQ70RKEY.Value;
     open;
    end;
    dm.AQ22.Open;
   dbgrid1.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form2.free;
end;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    active:=false;     //取系统用户员工指针赋值
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+form1.csi_rkey.Caption);
    active:=true;
    if not isempty then self.empl_ptr := fieldvalues['employee_ptr'];
   end;
  with dm.ADOQuery1 do
   begin
    active:=false;     //取服务器时间为时间字段赋值
    sql.Clear;
    sql.Add('select getdate() as serve_date');
    active:=true;
    self.sys_longdate := fieldvalues['serve_date'];
   end;
  maskedit1.Text := datetostr(sys_longdate);
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 IF edit1.Font.Color = clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit1.Text)<>'') then
 try
  form2:=tform2.Create(application);
  form2.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form2.AQ70PO_NUMBER.Value))=0 then
  begin
   edit1.Text := form2.AQ70PO_NUMBER.Value;
   edit1.Font.Color := clwindowtext;
   edit2.Text := form2.AQ70CODE.Value;
   label10.Caption := form2.AQ70SUPPLIER_NAME.Value;
   edit3.Text := form2.AQ70WAREHOUSE_CODE.Value;
   label11.Caption := form2.AQ70WAREHOUSE_NAME.Value;
   edit4.Text := form2.AQ70FACTORY_LOCATION.Value;
   edit5.Text := form2.AQ70PO_DATE.AsString;
   edit6.Text := form2.AQ70CONFIRMATION_NUMBER.Value;
   with dm.AQ71 do
    begin
     close;
     dm.AQ71.Parameters[0].Value := form2.AQ70RKEY.Value;
     open;
    end;
   dm.AQ22.Open;
  end
 else
  begin
   messagedlg('采购定单号码不正确,请重新输入或选择',mtinformation,[mbok],0);
   edit1.SetFocus;
  end;
 finally
  form2.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
  and (trim(edit1.Text)='') then
 begin
  edit2.Text := '';
  label10.Caption := '';
  edit3.Text := '';
  label11.Caption := '';
  edit4.Text := '';
  edit5.Text := '';
  edit6.Text := '';
  dm.AQ71.Close;
  dm.AQ22.Close;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 try
  form3:=tform3.Create(application);
  form3.Edit1.Text := formatfloat('0.000',dm.AQ22quan_on_hand.Value);
  if form3.ShowModal=mrok then
   begin
    dm.AQ22.Edit;
    dm.AQ22quan_to_be_shipped.Value := dm.AQ22quan_to_be_shipped.Value+
                                      strtofloat(form3.Edit2.text);
    dm.AQ22quan_on_hand.Value := dm.AQ22quan_on_hand.Value-
                                 strtofloat(form3.Edit2.text);
    dm.AQ22.Post;
   end;
 finally
  form3.free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.AQ22quan_on_hand.Value>0 then
  n1.Enabled := true
 else
  n1.Enabled := false;
 if dm.AQ22quan_to_be_shipped.Value>0 then
  n2.Enabled := true
 else
  n2.Enabled := false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 try
  form4:=tform4.Create(application);
  form4.Edit1.Text := formatfloat('0.000',dm.AQ22QUAN_RETURNED.Value);
  form4.Edit2.Text := formatfloat('0.000',dm.AQ22quan_to_be_shipped.Value);
  dm.aq96.Open;
  form4.ShowModal;
 // dm.AQ22.Close;
 // dm.AQ22.Open;
 finally
  form4.free;
  dm.aq96.Close;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s:string;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容
  csi_rkey.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库}
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString := db_ptr.Caption;
  dm.Adoconnection1.Connected :=true;
 end;  
end;

procedure TForm1.MaskEdit1Exit(Sender: TObject);
begin
  try
   strtodate(maskedit1.Text);
  except
   messagedlg('请输入正确的日期格式',mtinformation,[mbok],0);
   maskedit1.SetFocus;
  end;
end;

end.
