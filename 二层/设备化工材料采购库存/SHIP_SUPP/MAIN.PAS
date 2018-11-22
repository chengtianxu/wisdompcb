unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls,DateUtils;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    csi_rkey: TLabel;
    db_ptr: TLabel;
    vprev: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    user_ptr: TLabel;
    Memo1: TMemo;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    sys_longdate:tdatetime;
    hMapFile: THandle;
    MapFilePointer: Pointer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses damo, shipped_meth, warehouse_search, report_r, shipsupp_sql;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.Edit2.Text := dm.ADO22barcode_id.Value;
  if form2.ShowModal=mrok then
   begin
    dm.ADO22.close;
    dm.ADO22.Open;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 try
  form_wh:=tform_wh.Create(application);
  if form_wh.ADOQuery1.IsEmpty then
   messagedlg('没有找到相关记录!',mtconfirmation,[mbok],0)
  else
  if form_wh.ShowModal=mrok then
   begin
    edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    label2.Caption := form_wh.ADOQuery1.FieldValues['warehouse_name'];
    dm.ADO22.Close;
    dm.ADO22.Parameters[1].Value := form_wh.ADOQuery1.FieldValues['rkey'];
    dm.ADO22.Open;
   end;
 finally
  form_wh.free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO22.Active=true then
 if dm.ADO22quan_to_be_shipped.Value>0 then
  n1.Enabled := true
 else
  n1.Enabled := false
 else
  n1.Enabled := false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 dm.ADO22.Close;
 dm.ADO22.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString := db_ptr.Caption;
  dm.Adoconnection1.Connected :=true;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+csi_rkey.Caption);
    active:=true;
    user_ptr.Caption:=fieldbyname('employee_ptr').AsString;
   end;
   with dm.ADOQuery1 do
    begin
     active:=false;     //取服务器时间字段赋值
     sql.Clear;
     sql.Add('select getdate() as serve_date');
     active:=true;
     self.sys_longdate := fieldvalues['serve_date'];
    end;
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

  csi_rkey.Caption := trim(copy(S,1,pos(' ',s)));    //系统用户

  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库
  {}
//  sys_longdate:=now();
 // user_ptr.Caption:='3';  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TForm1.FormResize(Sender: TObject);
begin
dbgrid1.Columns[0].Width:=243+round((dbgrid1.Width-689)*243/664);
dbgrid1.Columns[1].Width:=155+round((dbgrid1.Width-689)*155/664);
dbgrid1.Columns[2].Width:=121+round((dbgrid1.Width-689)*121/664);
dbgrid1.Columns[3].Width:=145+round((dbgrid1.Width-689)*145/664);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 form3:=tform3.Create(application);
dm.ADOStoredProc1.Close;
dm.ADOStoredProc1.Parameters.ParamValues['@star_date']:=
    strtodate(datetostr(form1.sys_longdate))-
    dayof(strtodate(datetostr(form1.sys_longdate)))+1;
dm.ADOStoredProc1.Parameters.ParamValues['@end_date']:=
    strtodate(datetostr(form1.sys_longdate))+1;
dm.ADOStoredProc1.Open;

 form3.ShowModal;

 form3.Free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  begin
   showmessage(memo1.Text);
   memo1.SelectAll;
   memo1.CopyToClipboard;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  form_report.ppDesigner1.ShowModal;
 finally
  form_report.free;
 end;
end;

end.
