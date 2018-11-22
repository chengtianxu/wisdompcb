unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus , DB, ComCtrls,
  DBGridEh;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    N9: TMenuItem;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGridEh;
    Label3: TLabel;
    ComboBox1: TComboBox;
    CheckBox7: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
  private
    { Private declarations }
//    count:Integer;
   dbgrid2_coltotal:integer;
   v_colwidth: array of integer;
   field_name:string;
    FsSQL:string;
   OldGridWnd : TWndMethod;
   precolumn:Tcolumneh;
   procedure NewGridWnd (var Message : TMessage);
   function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
   empl_ptr:integer;
   stock_flag:string;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, received_search, po_search, direct_ware,
   mul_report,common, vmi_detail,MyClass;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;


//rkey73:='5';
//vprev:='4';
//dm.ADOConnection1.Open;

 precolumn:=dbgrid1.Columns[0];
 self.Caption:= application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 //DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';


end;

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

procedure TForm1.N9Click(Sender: TObject); 
begin
  if (strtoint(vprev)<>4) then
    messagedlg('对不起!您没有允许重印的权限',mtinformation,[mbok],0)
  else
  begin

    MyDataClass.Set_Filter('selected=1',dm.aqwz456);
    if dm.Aqwz456.IsEmpty then
    begin
      ShowMessage('请勾选入仓单号');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
//      dm.Aqwz456.EnableControls;
      Exit;
    end;
    if  dm.Aqwz456PRINTED.value<>'Y' then
    begin
      ShowMessage('勾选的入仓单号不允许重印');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
      Exit;
    end;
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    dm.ADO456.Edit;
    dm.ADO456PRINTED.Value:='N';
    dm.ADO456.Post;
    dm.Aqwz456.Filtered := False;
    dm.Aqwz456.Filter :='';
    dm.Aqwz456.Filtered := True;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
begin
 if dm.ADOConnection1.Connected then
 begin
  precolumn:=DBGrid1.Columns[1];
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select rkey,abbr_name from data0015' ;
  dm.ADOQuery1.Open;
  while not dm.ADOQuery1.Eof do
  begin
    ComboBox1.Items.Append(dm.ADOQuery1.Fields[1].asstring);
    dm.ADOQuery1.Next;
  end;
  FsSQL:=dm.Aqwz456.CommandText;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    empl_ptr := fieldvalues['EMPLOYEE_PTR'];
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select stock_in_flag from data0192');
    open;
    self.stock_flag := fieldvalues['stock_in_flag'];
   end;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;

  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 5;

  dm.aqwz456.Close;
  dm.aqwz456.Parameters[6].Value := dtpk1.Date;
  dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
  dm.aqwz456.Open;
  dm.Aqwz456.IndexFieldNames:=field_name;
  dm.Aqwz22.Open;
  dm.Aqwz235.Open;

  setlength(v_colwidth,dbgrid1.Columns.Count);
  dbgrid2_coltotal:=dbgrid1.Width;
  for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.aqwz456.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
 else dm.aqwz456.Filter:='';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.aqwz456.Close;
if not checkbox1.Checked then
 dm.aqwz456.Parameters[0].Value:=1
else
 dm.aqwz456.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.aqwz456.Parameters[1].Value:=2
else
 dm.aqwz456.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.aqwz456.Parameters[2].Value:=3
else
 dm.aqwz456.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.aqwz456.Parameters[3].Value:=4
else
 dm.aqwz456.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.aqwz456.Parameters[4].Value:=5
else
 dm.aqwz456.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.aqwz456.Parameters[5].Value:=6
else
 dm.aqwz456.Parameters[5].Value:=0;

 DM.aqwz456.open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.aqwz456.Close;
 dm.aqwz456.Parameters[6].Value := dtpk1.Date;
 dm.aqwz456.Parameters[7].Value := dtpk2.Date+1;
 dm.aqwz456.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
var i,rkey456:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    rkey456:=dm.Aqwz456rkey.Value;
    dm.Aqwz456.DisableControls;
    MyDataClass.Set_Filter('selected=1',dm.aqwz456);
    if dm.Aqwz456.IsEmpty then
    begin
      ShowMessage('请勾选入仓单号');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
      dm.Aqwz456.EnableControls;
      Exit;
    end;
  //     ShowMessage(ADS417_1rKey.AsString);

    dm.Aqwz456.First;
    while not dm.Aqwz456.Eof do
    begin
  //  dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i]; //
  //  dm.Aqwz456.GotoBookmark(Pointer(DBGrid1.SelectedRows[i]));   //
      dm.ADO456.Close;
      dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
      dm.ADO456.Open;
      if dm.ADO456STATUS.Value=2 then
      begin
        dm.ADO456.Edit;
        dm.ADO456STATUS.Value:=3;
        dm.ADO456AUDITED_BY.Value:=self.empl_ptr;
        dm.ADO456AUDITED_DATE.Value:=self.sys_longdate;
        dm.ADO456.Post;
      end;
      dm.Aqwz456.Next;
    end;

    dm.Aqwz456.Filtered := False;
    dm.Aqwz456.Filter :='';
    dm.Aqwz456.Filtered := True;

    dm.aqwz456.close;
    dm.aqwz456.open;
    dm.aqwz456.Locate('rkey',rkey456,[]);
    dm.ADO456.Close;
    dm.Aqwz456.EnableControls;
 
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  MyDataClass.Set_Filter('selected=1',dm.aqwz456);
  if dm.Aqwz456.IsEmpty then
  begin
    ShowMessage('请勾选入仓单号');
    dm.Aqwz456.Filtered := False;
    dm.Aqwz456.Filter :='';
    dm.Aqwz456.Filtered := True;
//    dm.Aqwz456.EnableControls;
    Exit;
  end;
  if (dm.Aqwz456TTYPE.Value <>3) and (dm.Aqwz456TTYPE.Value<>5) then       //编码入仓
  begin
    form2:=tform2.Create(application);
    form2.aded_flag:=4;
    form2.BitBtn1.Enabled:=false;
    form2.BitBtn4.Enabled:=false;

    form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
    form2.Edit1.Enabled:=false;
    form2.Edit5.Enabled:=false;
    form2.Edit6.Enabled:=false;
    form2.edit11.Enabled:=false;
    form2.edit7.Enabled:=false;
    form2.combobox1.enabled:=false;
    form2.CheckBox1.Enabled:=false;
    if form2.ShowModal=mrok then
    begin

    end;
    form2.Free;
  end
  else if dm.Aqwz456TTYPE.Value=3 then
  try
    form4:=tform4.Create(application);
    form4.aded_flag:=3;
    form4.edit1.enabled:=false;
    form4.edit2.enabled:=false;
    form4.edit5.enabled:=false;
    form4.edit6.enabled:=false;
    form4.edit11.enabled:=false;
    form4.bitbtn1.enabled:=false;
    form4.bitbtn2.enabled:=false;
    form4.bitbtn4.enabled:=false;
    form4.bitbtn5.enabled:=false;
    form4.strgrid1.popupmenu:=form4.popupmenu2;
    if form4.ShowModal=mrok then
    begin
     dm.aqwz456.Close;
     dm.aqwz456.Open;
     dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
     dm.ADO456.Close;
    end;
  finally
    form4.Free;
  end
  else
  try
    form6:=tform6.Create(application);
    form6.aded_flag:=3;
    form6.BitBtn1.Enabled:=false;
    form6.StrGrid1.Options:=form6.StrGrid1.Options-[goEditing];
    form6.Edit1.Enabled:=false;
    form6.Edit5.Enabled:=false;
    form6.Edit6.Enabled:=false;
    form6.edit11.Enabled:=false;
    form6.edit7.Enabled:=false;
    if form6.ShowModal=mrok then
    begin
    dm.aqwz456.Close;
    dm.aqwz456.Open;
    dm.aqwz456.Locate('rkey',dm.ado456rkey.Value,[]);
    dm.ADO456.Close;
    end;
  finally
    form6.Free;
  end;
  dm.Aqwz456.Filtered := False;
  dm.Aqwz456.Filter :='';
  dm.Aqwz456.Filtered := True;
end;

procedure TForm1.N5Click(Sender: TObject);
var str:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要将该入仓单退回仓库处理吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    MyDataClass.Set_Filter('selected=1',dm.aqwz456);
    if dm.Aqwz456.IsEmpty then
    begin
      ShowMessage('请勾选入仓单号');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
//      dm.Aqwz456.EnableControls;
      Exit;
    end;
    if dm.Aqwz456STATUS.Value<>2 then
    begin
      ShowMessage('勾选的入仓单号不是未审核状态，不能退回');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
      Exit;
    end;
    dm.ADO456.Close;
    dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
    dm.ADO456.Open;
    if dm.ADO456STATUS.Value=dm.aqwz456STATUS.Value then
    begin
     if inputquery('审核退回','请输入退回信息           ',str) then
     begin
      dm.ADO456.Edit;
      dm.ADO456status.Value := 6;
      dm.ADO456REF_NUMBER.Value:=str;
      dm.ADO456.Post;
      dm.aqwz456.close;
      dm.aqwz456.open;
      dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
      dm.ADO456.Close;
     end;
    end
    else begin
      dm.aqwz456.close;
      dm.aqwz456.open;
      dm.aqwz456.Locate('rkey',dm.ADO456rkey.value,[]);
      dm.ADO456.Close;
      showmessage('退回操作不成功，状态值发生改变');
    end;
    dm.Aqwz456.Filtered := False;
    dm.Aqwz456.Filter :='';
    dm.Aqwz456.Filtered := True;
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
var i,rkey456:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要将该入仓单取消审核,重新审核吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    rkey456:=dm.Aqwz456rkey.Value;
    dm.Aqwz456.DisableControls;
    MyDataClass.Set_Filter('selected=1',dm.aqwz456);
    if dm.Aqwz456.IsEmpty then
    begin
      ShowMessage('请勾选入仓单号');
      dm.Aqwz456.Filtered := False;
      dm.Aqwz456.Filter :='';
      dm.Aqwz456.Filtered := True;
      dm.Aqwz456.EnableControls;
      Exit;
    end;
    dm.Aqwz456.First;
    while not dm.Aqwz456.Eof do
    BEGIN
//      dbgrid1.DataSource.DataSet.Bookmark := dbgrid1.SelectedRows.Items[i];  //
//      dm.Aqwz456.GotoBookmark(Pointer(DBGrid1.SelectedRows[i]));//
      dm.ADO456.Close;
      dm.ADO456.Parameters[0].Value := dm.aqwz456RKEY.Value;
      dm.ADO456.Open;
      if dm.ADO456STATUS.Value=3 then
      begin
        dm.ADO456.Edit;
        dm.ADO456status.Value := 2;
        dm.ADO456AUDITED_BY.AsVariant:=null;
        dm.ADO456AUDITED_DATE.AsVariant:=null;
        dm.ADO456.Post;
      end;
      dm.Aqwz456.Next;
    end;
    dm.Aqwz456.Filtered := False;
    dm.Aqwz456.Filter :='';
    dm.Aqwz456.Filtered := True;
    dm.aqwz456.close;
    dm.aqwz456.open;
    dm.aqwz456.Locate('rkey',rkey456,[]);
    dm.ADO456.Close;
    dm.Aqwz456.EnableControls;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin

//MyDataClass.Set_Filter('selected=1',dm.aqwz456);
//if dbgrid1.SelectedRows.Count>1 then
  if dm.count>1 then
  begin
    N2.Enabled:=TRUE;
    n3.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=true;
    n9.Enabled:=false;
  end
  else
  begin
    if dbgrid1.SelectedRows.Count=0 then
    dbgrid1.SelectedRows.CurrentRowSelected:=true;
 
    if dm.aqwz456.IsEmpty then
    begin
      n2.Enabled:=false;
      n3.Enabled:=false;

      n5.Enabled:=false;
      n6.Enabled:=false;
      n9.Enabled:=false;

    end
    else
    begin
      n2.Enabled:=true;
      n3.Enabled:=true;

      n5.Enabled:=true;
      n6.Enabled:=true;
      if  dm.Aqwz456PRINTED.value='Y' then
       n9.Enabled:=true
      else
        n9.Enabled:=false;

      case dm.aqwz456STATUS.Value of
        1:
         begin
          n6.Enabled:=false;
          n2.enabled:=false;
          n5.Enabled:=false;
         end;
        2:
         begin
          n2.Enabled:=true;
          n6.Enabled:=false;
         end;
        3:
         begin
          n2.Enabled:=false;
          n5.Enabled:=false;
         end;
        4:
         begin
          n2.Enabled:=false;
          n5.Enabled:=false;
          n6.Enabled:=false;
         end;
        5:
         begin
          n2.Enabled:=false;
          n5.Enabled:=false;
          n6.Enabled:=false;
         end;
        6:
         begin
          n2.enabled:=false;
          n5.Enabled:=false;
          n6.Enabled:=false;
         end;

      end;
    end;
  end;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var v_rkey68: integer;
begin
 v_rkey68 := 0;
 if not dm.aqwz456.IsEmpty then  v_rkey68 := dm.aqwz456rkey.Value;
 dm.aqwz456.Close;
 dm.aqwz456.Open;
 if v_rkey68 > 0 then  dm.aqwz456.Locate('rkey',v_rkey68,[]);
end;

procedure TForm1.FormResize(Sender: TObject);
var i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-dbgrid2_coltotal)*
    v_colwidth[i]/(dbgrid2_coltotal-25));
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 form3:=tform3.create(application);
 form3.showmodal;
 form3.free;
end;


procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.aqwz456status.value=6 then
  DBGrid1.Canvas.Font.Color := clRed
 else
  if dm.aqwz456status.value=1 then
   DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.aqwz456.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.Aqwz456.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.Aqwz456.IndexFieldNames:=column.FieldName;
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

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  dm.Aqwz456.Close;
 if ComboBox1.ItemIndex=0 then
   dm.Aqwz456.CommandText:=FsSQL
  else
   dm.Aqwz456.CommandText:=FsSQL+' and data0015.abbr_name='''+ComboBox1.Text+'''';
 dm.Aqwz456.Open;
end;



function TForm1.UpdateValueToField(pDataSet: TDataSet; value: variant;
  FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.DisableControls;
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        pDataSet.Edit;
        pDataSet.FieldByName(FieldName).Value := Value;
        pDataSet.Post;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  UpdateValueToField(dm.Aqwz456,checkbox7.Checked,'selected');
end;

end.
