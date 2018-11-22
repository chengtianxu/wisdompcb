unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    csi_rkey: TLabel;
    ADOQuery2: TADOQuery;
    db_ptr: TLabel;
    vprev: TLabel;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1inv_part_number: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1quantity: TFloatField;
    ADOQuery1quan_to_be_shipped: TBCDField;
    ADOQuery1QUAN_RETURNED: TBCDField;
    ADOQuery1quan_on_hand: TFloatField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1inventory_ptr: TIntegerField;
    BitBtn4: TBitBtn;
    ADOQuery1ship_DATE: TDateTimeField;
    ADOQuery1inv_name: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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

uses supplier_search, warehouse_search, return_nopo, edit_return;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
try
 form_supp:=tform_supp.Create(application);
 form_supp.Edit1.Text := trim(edit2.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
  end
 else
 if form_supp.ShowModal=mrok then
  begin
   edit2.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit2.Font.Color := clwindowtext;
   label4.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with Adoquery1 do
    begin
     close;
     sql.Delete(12);
     sql.Insert(12,'and data0456.supp_ptr='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
   dbgrid1.SetFocus;
  end
 else
  edit2.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
 IF edit2.Font.Color=clwindowtext then
  begin
   edit2.Font.Color := clblue;
   edit2.SelectAll;
  end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn3')
   and (trim(edit2.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit2.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit2.Font.Color := clwindowtext;
   label4.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with adoquery1 do
    begin
     close;
     sql.Delete(12);
     sql.Insert(12,'and data0456.supp_ptr='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label4.Caption := '';
   edit2.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn3')
 and (trim(edit2.Text)='') then
 with adoquery1 do
  begin
   close;
   sql.Delete(12);
   sql.Insert(12,'');
   open;
   label4.Caption := '';
  end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 IF edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 form_wh:=tform_wh.Create(application);
 form_wh.Edit1.Text := trim(edit1.Text);
 if form_wh.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form_wh.ShowModal=mrok then
  begin
   edit1.Text := form_wh.ADOQuery1.fieldbyname('warehouse_code').AsString;
   edit1.Font.Color := clwindowtext;
   label3.Caption := form_wh.ADOQuery1.fieldbyname('warehouse_name').AsString;
   with Adoquery1 do
    begin
     close;
     sql.Delete(11);
     sql.Insert(11,'and data0456.warehouse_ptr='+form_wh.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
    edit2.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_wh.free;
end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit1.Text)<>'') then
 try
  form_wh:=tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
  begin
   edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit1.Font.Color := clwindowtext;
   label3.Caption := form_wh.ADOQuery1.FieldValues['warehouse_name'];
   with adoquery1 do
    begin
     close;
     sql.Delete(11);
     sql.Insert(11,'and data0456.warehouse_ptr='+form_wh.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label3.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_wh.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
 and (trim(edit1.Text)='') then
 with adoquery1 do
  begin
   close;
   sql.Delete(11);
   sql.Insert(11,'');
   open;
   label3.Caption := '';
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if adoquery1.Active=true then
 begin
  if adoquery1.FieldValues['quan_on_hand']>0 then
   n1.Enabled := true
  else
   n1.Enabled := false;

  if adoquery1.FieldValues['quan_to_be_shipped']>0 then
   begin
    n2.Enabled := true;
    n3.Enabled := true;
   end
  else
   begin
    n2.Enabled := false;
    n3.Enabled := false;
   end;
 end
else
 begin
   n1.Enabled := false;
  n2.Enabled := false;
  n3.Enabled := false;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 try
  form2:=tform2.Create(application);
  form2.Edit1.Text := formatfloat('0.000',adoquery1.FieldValues['quan_on_hand']);
  if form2.ShowModal=mrok then
   begin
    adoquery1.Edit;
    adoquery1.FieldValues['quan_to_be_shipped']:=adoquery1.FieldValues['quan_to_be_shipped']+
                                             strtofloat(form2.Edit2.text);
    adoquery1.FieldValues['quan_on_hand']:= adoquery1.FieldValues['quan_on_hand']-
                                strtofloat(form2.Edit2.text);
    adoquery1.Post;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 try
  form3:=tform3.Create(application);
  form3.Edit1.Text := formatfloat('0.000',adoquery1.FieldValues['QUAN_RETURNED']);
  form3.Edit2.Text := formatfloat('0.000',adoquery1.FieldValues['quan_to_be_shipped']);
  form3.Edit3.Text := formatfloat('0.000',adoquery1.FieldValues['quan_on_hand']);
  form3.ShowModal;
 finally
  form3.free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 try
  form3 := tform3.Create(application);
  form3.Edit1.Text := formatfloat('0.000',adoquery1.FieldValues['QUAN_RETURNED']);
  form3.Edit2.Text := formatfloat('0.000',adoquery1.FieldValues['quan_to_be_shipped']);
  form3.Edit3.Text := formatfloat('0.000',adoquery1.FieldValues['quan_on_hand']);
  form3.BitBtn1.Visible := false;
  form3.BitBtn2.Visible := false;
  form3.BitBtn3.Left := 6;
  form3.DBGrid1.ReadOnly := true;
  form3.ShowModal;
 finally
  form3.free;
 end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
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
if not ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  adoconnection1.ConnectionString := db_ptr.Caption;
  Adoconnection1.Connected :=true;
  adoquery1.Open;
  with ADOQuery2 do
   begin
    active:=false;     //取系统用户员工指针赋值
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+form1.csi_rkey.Caption);
    active:=true;
    self.empl_ptr := fieldvalues['employee_ptr'];
   end;
  with ADOQuery2 do
   begin
    active:=false;     //取服务器时间为时间字段赋值
    sql.Clear;
    sql.Add('select getdate() as serve_date');
    active:=true;
    self.sys_longdate := fieldvalues['serve_date'];
   end;
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 rkey22:integer;
begin
 rkey22:=self.ADOQuery1rkey.Value;
 adoquery1.Close;
 adoquery1.Open;
 if rkey22>0 then
  adoquery1.Locate('rkey',rkey22,[]);
end;

end.
