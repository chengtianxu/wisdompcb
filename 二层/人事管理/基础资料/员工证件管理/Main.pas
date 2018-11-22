unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,common, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DateUtils,
  DB, ADODB, DBClient, ComCtrls;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    N_Append: TMenuItem;
    N_Edit: TMenuItem;
    N4: TMenuItem;
    N_delete: TMenuItem;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    Label4: TLabel;
    DBGridEh2: TDBGridEh;
    Label5: TLabel;
    DBGridEh3: TDBGridEh;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    N6_See: TMenuItem;
    N_bAppend: TMenuItem;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure item_click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N_AppendClick(Sender: TObject);
    procedure init(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N_deleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6_SeeClick(Sender: TObject);
    procedure N_bAppendClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    
    v_date:string;
    sql:string;
  public
    preColumn:TColumnEh;
    str_employee_name:string;
    newrkey:string;
    procedure DataSetAddToCombobox(ADataSet:TDataSet;co:TCustomComboBox;FieldName:string='');
    { Public declarations }
    
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses dmo, AddCertificate, UQuery, form_Main1, form_Main2;

{$R *.dfm}

procedure TFrm_Main.DataSetAddToCombobox(ADataSet:TDataSet;co:TCustomComboBox;FieldName:string='');
begin
  try
    if ADataSet.Active=False then
    ADataSet.Open;
    ADataSet.DisableControls;
    ADataSet.First;
    while not( ADataSet.Eof )   do
    begin
      if FieldName='' then
        co.Items.Add(trim(ADataSet.Fields[0].AsString))
      else
        co.Items.Add(trim(ADataSet.FieldByName(FieldName).AsString));
      ADataSet.Next;
    end;
  finally
    ADataSet.EnableControls;
  end;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
 {} if not App_Init(dm.ADOConn) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end; 
  self.Caption:=application.Title;
{ 
  dm.ADOConn.Close;
  dm.ADOConn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConn.Open;
  user_ptr := '2460';
  rkey73:= '96';
  vprev := '2';  }

  if StrToInt(vprev)in[1,3] then
  begin
    dm.cdsHrcertificate   .ReadOnly:=True;
    dm.cdsHrcertificate1  .ReadOnly:=True;
    N_Append.Enabled:=False;
    N_bAppend.Enabled:=False;
    N_delete.Enabled:=False;
    N_Edit.Enabled:=False;
  end;

  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select getdate() as v_date');
    Open;                                 //全局变量
    v_date:=datetostr(fieldvalues['v_date']);//短日期格式
  end;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  DM.cdsHrcertificate.Close;
  DM.cdsHrcertificate.Params[0].Value:=DateToStr(StrToDate(v_date)-1095);
  DM.cdsHrcertificate.Params[1].Value:=v_date;
  DM.cdsHrcertificate.Params[2].Value:=1;
  DM.cdsHrcertificate.Open;
  Label3.Caption:=IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
  DM.ADOHrcertificate_1.Close;
  DM.ADOHrcertificate_1.Parameters[0].Value:=v_date;
  DM.ADOHrcertificate_1.Parameters[1].Value:=1;
  DM.ADOHrcertificate_1.Open;
  Label6.Caption:=IntToStr(DBGridEh2.DataSource.DataSet.RecordCount);
  DM.ADOHrcertificate_2.Close;
  DM.ADOHrcertificate_2.Parameters[0].Value:=v_date;
  DM.ADOHrcertificate_2.Parameters[1].Value:=1;
  DM.ADOHrcertificate_2.Open;
  Label7.Caption:=IntToStr(DBGridEh3.DataSource.DataSet.RecordCount);
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    for i:=1 to DBGridEh1.Columns.Count do
    begin
      item := TmenuItem.Create(self);
      item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
      if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
      item.OnClick := item_click ;
      Popup1.Items.Add(item) ;
    end;
  end;
  sql:=DM.cdsHrcertificate.CommandText;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select employee_name from data0005 where rkey ='+user_ptr;
    Open;
    str_employee_name:=FieldValues['employee_name'];
  end;

  Query_Form.dtpk1.Date:= StrToDate(v_date)-1095;
  Query_Form.dtpk2.Date:= StrToDate(v_date)+1;
  DM.dt_v_employeemsg.Open;
  DBGridEh1TitleClick(DBGridEh1.Columns[0]);
end;

procedure TFrm_Main.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
var
//  bm:TBookmark;
  i_employeeid,i_datadetail_ptr :Integer;
  D_inputdate:TDateTime;
begin
  i_employeeid     := DM.cdsHrcertificate.fieldByName('employeeid').Value;
  i_datadetail_ptr := DM.cdsHrcertificate.fieldByName('datadetail_ptr').Value;
  D_inputdate      := DM.cdsHrcertificate.fieldByName('inputdate').Value;
  try
  //  DM.cdsHrcertificate.Refresh;
    DM.cdsHrcertificate.Close;
////    DM.ADOHrcertificate.Parameters[0].Value:=DateToStr(Query_Form.dtpk1.Date-1095);
////    DM.ADOHrcertificate.Parameters[1].Value:=DateToStr(Query_Form.dtpk2.Date);
    DM.cdsHrcertificate.Open;
    Label3.Caption:=IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
//    DM.ADOHrcertificate_1.Close;
//    DM.ADOHrcertificate_1.Parameters[0].Value:=v_date;
    DM.ADOHrcertificate_1.Open;
    Label6.Caption:=IntToStr(DBGridEh2.DataSource.DataSet.RecordCount);
    DM.ADOHrcertificate_2.Close;
//    DM.ADOHrcertificate_2.Parameters[0].Value:=v_date;
    DM.ADOHrcertificate_2.Open;
    Label7.Caption:=IntToStr(DBGridEh3.DataSource.DataSet.RecordCount);
    DM.cdsHrcertificate.Locate('employeeid;datadetail_ptr;inputdate',VarArrayOf([i_employeeid,i_datadetail_ptr,D_inputdate]),[]) ;
   // DM.cdsHrcertificate.GotoBookmark(bm);
  finally
   // DM.cdsHrcertificate.FreeBookmark(bm);
  end;
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var
 i:byte;
 
begin
  with Query_Form do
  begin
//    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',DM.cdsHrcertificate.Params.ParamValues['dtpk1']));
//    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',DM.cdsHrcertificate.Params.ParamValues['dtpk2']))+1;
    if ShowModal=mrok then
    with DM.cdsHrcertificate do
    begin
      Close;
      //with   Frm_Main .DBGridEh1 do
//        for i:=0 to  DBGridEh1.Columns.Count-1  do
//        begin
//          if  DBGridEh1.Columns[i].Title.SortMarker<> smNoneEh   then
//          DBGridEh1.Columns[i].Title.SortMarker:= smNoneEh;
//        end;
      CommandText:=sql+#13;
      for i:=1 to SGrid1.RowCount-2 do
        CommandText:=CommandText+SGrid1.Cells[2,i]+#13;
      Params.ParamValues['dtpk1']:=strtodate(formatdatetime('yyyy-mm-dd ',dtpk1.Date));
      Params.ParamValues['dtpk2']:=strtodate(formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
    //  ShowMessage(CommandText);
      Open;
    end;
  end;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
begin
  if not DM.cdsHrcertificate.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh1,Application.Title);
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
var
  OldIndex: string;
begin
  with (Column.Grid.DataSource.DataSet as TClientDataSet) do
  begin
    OldIndex:= IndexName;
    if OldIndex <> '' then
    begin
      IndexName:= '';
      DeleteIndex(OldIndex);
      
    end;
    case Column.Title.SortMarker of
      smNoneEh ,smUpEh  :
      begin
        AddIndex('px', Column.Field.FieldName, [ixDescending]);
        Column.Title.SortMarker:= smDownEh;
        IndexName:= 'px';
      end;
      smDownEh:
      begin
        AddIndex('px', Column.Field.FieldName, [ixPrimary]);
        Column.Title.SortMarker:= smUpEh;
        IndexName:= 'px';
      end;
//      smNoneEh:
//      begin
//
//      end;
    end;
    
  end;
//  if Column.Title.SortMarker=smUpEh then
//  begin
//    Column.Title.SortMarker:= smDownEh;
//    DM.cdsHrcertificate.IndexFieldNames:=Column.FieldName+' DESC';
//  end
//  else
//  begin
//    Column.Title.SortMarker:=smUpEh;
//    DM.cdsHrcertificate.IndexFieldNames:=Column.FieldName;
//  end;
  if Column.Tag<>1 then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
      Edit1.SetFocus;
    end;
  end;
end;

procedure TFrm_Main.N_AppendClick(Sender: TObject);
begin
  try
  //  if Assigned(frm_Main1)=False then
    begin
      Application.CreateForm(Tfrm_Main1, frm_Main1);
    end;
    DM.cdsHrcertificate.Append;
    frm_Main1.ET( frm_Main1,['edt_chinesename1']);
    frm_Main1.ShowModal;
  finally
    frm_Main1.Free;
  end;

  
{  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  init(nil);
  Frm_AddCertificate.dtpk1.Date:=StrToDate(FormatDateTime('yyyy-mm-dd',StrToDate(v_date)));
  Frm_AddCertificate.dtpk2.Date:=StrToDate(FormatDateTime('yyyy-mm-dd',StrToDate(v_date)+365));
  if Frm_AddCertificate.ShowModal=mrok then
  begin
    DM.ADOConn.BeginTrans;
    try
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='insert into hrcertificate(code,datadetail_ptr,employeeid,type,startdate,enddate,inputdate,opration_person,status,remark) '+
                  'values( '+QuotedStr(Trim(Frm_AddCertificate.Edit2.Text))+','+inttostr(Frm_AddCertificate.Label9.Tag)+
                  ','+ IntToStr(Frm_AddCertificate.Edit1.Tag)+','+inttostr(Frm_AddCertificate.types)+
                  ','+QuotedStr(DateToStr(Frm_AddCertificate.dtpk1.Date))+','+QuotedStr(DateToStr(Frm_AddCertificate.dtpk2.Date))+
                  ','+QuotedStr(v_date)+','+user_ptr+
                  ','+inttostr(Frm_AddCertificate.status)+','+QuotedStr(Trim(Frm_AddCertificate.Memo1.Lines.Text))+')';
        ExecSQL;
      end;
      DM.ADOConn.CommitTrans;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select top 1 rkey from hrcertificate order by rkey desc';
        Open;
      end;
      newrkey:=IntToStr(DM.ADOQuery1.FieldValues['rkey']);
      BitBtn2Click(nil);
      DM.ADOHrcertificate.Locate('rkey',newrkey,[]);
    except
      DM.ADOConn.RollbackTrans;
      ShowMessage('保存数据失败');
    end;
  end;  }
end;

procedure TFrm_Main.init(Sender: TObject);
begin
  Frm_AddCertificate:=TFrm_AddCertificate.Create(Application);
  Frm_AddCertificate.ComboBox1.Items.Clear;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from datadetail where dictid in (select rkey from datadict where item=''证书名称'')';
    Open;
    First;
    while not Eof do
    begin
      Frm_AddCertificate.ComboBox1.Items.Add(FieldValues['item']);
      Next;
    end;
  end;
end;

procedure TFrm_Main.N_EditClick(Sender: TObject);
//var
//  i:Integer;
begin
  try
  //  if Assigned(frm_Main1)=False then
    begin
      Application.CreateForm(Tfrm_Main1, frm_Main1);
    end;
    DM.cdsHrcertificate.Edit;
    frm_Main1.ET( frm_Main1,['edt_chinesename1']);
    frm_Main1.ShowModal;
  finally
    frm_Main1.Free;
  end;

  
{    原代码
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  init(nil);
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,chinesename from v_employeemsg where rkey='+DM.ADOHrcertificateemplreky.Text;
    Open;
  end;
  with DM.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,item from  datadetail where rkey='+DM.ADOHrcertificatedetarkey.Text;
    Open;
  end;
  with Frm_AddCertificate do
  begin
    Edit1.Text:=DM.ADOQuery1.FieldValues['chinesename'];
    Edit1.Tag:=DM.ADOQuery1.FieldValues['rkey'];
    Edit2.Text:=dm.ADOHrcertificatecode.Value;
    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.ADOQuery2.FieldValues['item']);
    Label9.Tag:=DM.ADOQuery2.FieldValues['rkey'];
    if DM.ADOHrcertificatetype.Value='个人' then
    begin
      ComboBox2.ItemIndex:=0;
      types:=0;
    end
    else
    begin
      ComboBox2.ItemIndex:=1;
      types:=1;
    end;
    dtpk1.Date:=DM.ADOHrcertificatestartdate.Value;
    dtpk2.Date:=DM.ADOHrcertificateenddate.Value;
    if DM.ADOHrcertificateItemStatus.Value='有效' then
      rdo1.Checked:=True
    else
      rdo2.Checked:=True;
    Memo1.Lines.Text:=DM.ADOHrcertificateremark.Value;
  end;
  if Frm_AddCertificate.ShowModal=mrok then
  begin
    newrkey:=IntToStr(DM.ADOHrcertificaterkey.Value);
    DM.ADOConn.BeginTrans;
    try
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update hrcertificate set code='+QuotedStr(Trim(Frm_AddCertificate.Edit2.Text))+',datadetail_ptr='+inttostr(Frm_AddCertificate.Label9.Tag)+
                  ',employeeid='+IntToStr(Frm_AddCertificate.Edit1.Tag)+',type='+inttostr(Frm_AddCertificate.types)+
                  ',startdate='+QuotedStr(DateToStr(Frm_AddCertificate.dtpk1.Date))+',enddate='+QuotedStr(DateToStr(Frm_AddCertificate.dtpk2.Date))+
                  ',inputdate='+QuotedStr(v_date)+',opration_person='+user_ptr+',status='+inttostr(Frm_AddCertificate.status)+
                  ',remark='+QuotedStr(Trim(Frm_AddCertificate.Memo1.Lines.Text))+' '+
                  'where rkey='+IntToStr(DM.ADOHrcertificaterkey.Value);
        ExecSQL;
      end;
      DM.ADOConn.CommitTrans;
      BitBtn2Click(nil);
      DM.ADOHrcertificate.Locate('rkey',newrkey,[]);
    except
      DM.ADOConn.RollbackTrans;
      ShowMessage('保存数据失败');
    end;
  end;  }
end;
procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    begin
      DM.cdsHrcertificate.Filtered := False;
      DM.cdsHrcertificate.Filtered := True ;
    end
  else
    DM.cdsHrcertificate.Filtered:=False;
//  if Trim(Edit1.Text)<>'' then
//    DM.cdsHrcertificate.Filter:=preColumn.FieldName+' like ''%' +trim(Edit1.Text)+'%'''
//  else
//    DM.cdsHrcertificate.Filter:='';
//  Label3.Caption:=IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure TFrm_Main.N_deleteClick(Sender: TObject);
var
  s,i:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  with DM.cdsHrcertificate do
  if Active and (not IsEmpty) then
   begin
     s:=messagebox(Self.Handle,'你确定要删除吗?删除后将不能恢复！','询问',MB_YESNO+MB_iconquestion) ;
     if S = idyes  then
     begin
       with DBGridEh1 do
       begin
         if SelectedRows.Count >1 then  //如果用户选择的行数大于1，即多行。
           begin
             try
               with   DataSource.DataSet   do
               for i:= SelectedRows.Count -1 downto 0 do
               begin
               GotoBookmark(pointer(SelectedRows.Items[i]));
               Delete;        //删除多行。
               end;
             finally
             end;
           end
         else
           DataSource.DataSet.Delete; //否则用户选择的是单行，删除。
       end ;
       DM.cdsHrcertificate.ApplyUpdates(0);
     end;
   end;
 { 原代码
 DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='delete Hrcertificate where rkey='+inttostr(DM.ADOHrcertificaterkey.Value);
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    BitBtn2Click(nil);
  except
    DM.ADOConn.RollbackTrans;
    ShowMessage('删除数据失败');
  end;  }
end;

procedure TFrm_Main.Button1Click(Sender: TObject);
begin
  DM.cdsHrcertificate.Delete;
end;

procedure TFrm_Main.FormActivate(Sender: TObject);
begin
  WindowState:=wsMaximized
end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText)      ;
  end;
end;

procedure TFrm_Main.N6_SeeClick(Sender: TObject);
begin
  try
  //  if Assigned(frm_Main1)=False then
    begin
      Application.CreateForm(Tfrm_Main1, frm_Main1);
    end;
    frm_Main1.EF( frm_Main1);
    frm_Main1.DataSource1StateChange(nil);
    with  frm_Main1 do
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btDelete.Enabled:=False;
      BitBtn3.Enabled:=False;
    end;
    frm_Main1.ShowModal;
  finally
    frm_Main1.Free;
  end;

end;

procedure TFrm_Main.N_bAppendClick(Sender: TObject);
begin
  with frm_Main2 do
  try
    if Assigned(frm_Main2)=False then
    Application.CreateForm(Tfrm_Main2, frm_Main2);

    DataSource1StateChange(DataSource1);
    DataSource1.DataSet.Open;
   // DataSource1.DataSet.Append;
    ShowModal;
  finally
    DataSource1.DataSet.Close;
    BitBtn2Click (nil);
  end;

end;

procedure TFrm_Main.DBGridEh1DblClick(Sender: TObject);
begin
  //N6_See.Click;
    N6_SeeClick(Sender);
end;

procedure TFrm_Main.CheckBox1Click(Sender: TObject);
begin
   DM.cdsHrcertificate.Close;
    DM.ADOHrcertificate_1.Close;
     DM.ADOHrcertificate_2.Close;
  if CheckBox1.Checked = True then
  begin
   DM.cdsHrcertificate.Params[2].Value:=2;
    DM.ADOHrcertificate_1.Parameters[1].Value:=2;
     DM.ADOHrcertificate_2.Parameters[1].Value:=2;
   end
  else
  begin
   DM.cdsHrcertificate.Params[2].Value:=1;
    DM.ADOHrcertificate_1.Parameters[1].Value:=1;
     DM.ADOHrcertificate_2.Parameters[1].Value:=1;
   end;
  DM.cdsHrcertificate.Open;
   DM.ADOHrcertificate_1.Open;
    DM.ADOHrcertificate_2.Open;

end;

end.
