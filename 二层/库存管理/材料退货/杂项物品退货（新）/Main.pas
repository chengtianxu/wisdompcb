unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitClose: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    BitFieldsVisable: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitCloseClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitQueryClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    PreColumn:TColumnEh;
    ssql,sql_text,fName,sName:string;
    RK419,smsort:Integer;
//    procedure item_click(sender: TObject);
    { Private declarations }
  public
     empl_ptr:integer;
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

uses damo,common,DB, QuerySet, pasSetFieldName, detail, return_quan;

{$R *.dfm}

//procedure TFrm_main.item_click(sender: TObject);
//var
//  i:byte;
//begin
//  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
//  for i := 0 to dbgrideh1.FieldCount - 1 do
//  if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
//  begin
//    if (sender as tmenuItem).Checked then
//    begin
//      dbgrideh1.Columns[i].Visible := true;
//      break;
//    end
//    else
//    begin
//      dbgrideh1.Columns[i].Visible := false;
//      break;
//    end;
//  end ;
//
//end;

procedure TFrm_main.FormShow(Sender: TObject);
var
  i:Integer;
begin
  fName := DBGridEh1.Columns[0].FieldName;
  sName := DBGridEh1.Columns[0].FieldName;
  smsort :=0;
  with dm.tmp do
  begin
    Close;     //取系统用户员工指针赋值
    sql.Text := 'select employee_ptr from data0073 where rkey='+rkey73;
    Open;
    if not isempty then
      self.empl_ptr := fieldvalues['employee_ptr'];
  end;
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    if not IsEmpty then
      Rk419:=FieldByName('rkey').AsInteger
    else
      Rk419:=-1;//2570;
  end;
  sql_text := DM.ADS235.CommandText;
  frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-90;
  frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  DM.ADS235.Close;
  DM.ADS235.CommandText := DM.ADS235.CommandText+' and dbo.Data0235.QUAN_ON_HAND > 0'+#13+' and (Data0456.ship_DATE  >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (Data0456.ship_DATE  <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';;
  DM.ADS235.Open;
  try
    DM.Ado0849.Close;
    DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
    DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
    DM.Ado0849.Prepared;
    DM.Ado0849.Open;
    if (not DM.Ado0849.IsEmpty) then
    begin
      DM.CDS2.Data:=DM.DSP2.Data;
      
      for i:=DBGridEh1.Columns.Count downto 1 do
      begin
        DBGridEh1.Columns.Delete(i-1);
      end;

      dm.CDS2.First;
      dm.CDS2.IndexFieldNames:='FieldOrder';
      dm.CDS2.Filtered:=True;
//      DBGridEh1.Columns.Add.FieldName:=DM.ADS567.Fields.Fields[0].FieldName;
//      DBGridEh1.Columns[0].Title.Caption:='选择';
//      DBGridEh1.Columns[0].Width:=35;
      i:=0;
      while not DM.CDS2.Eof do
      begin
        if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
        begin
          DBGridEh1.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
          DBGridEh1.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
          DBGridEh1.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
          DBGridEh1.Columns[i].Visible :=True;
          Inc(i);
          dm.CDS2.Next;
        end
        else
        begin
          dm.CDS2.Next;
        end;
      end;
      dm.CDS2.Filtered:=False;
    end
    else //没有849，保存
    begin
      dm.Ado849s.Close;
      dm.Ado849s.Open;
      for i:=0 to DBGridEh1.FieldCount-1 do
      begin
        DM.Ado849s.Append;
        DM.Ado849s.FieldByName('D419_ptr').Value:=Rk419;
        DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
        DM.Ado849s.FieldByName('FormName').Value:='Frm_main';
        DM.Ado849s.FieldByName('GridName').Value:='DBGridEh1';
        DM.Ado849s.FieldByName('FieldName').Value:=DBGridEh1.Columns[i].FieldName;;
        DM.Ado849s.FieldByName('FieldCaption').Value:=DBGridEh1.Columns[i].Title.Caption;
        DM.Ado849s.FieldByName('FieldOrder').Value:=i;
        DM.Ado849s.FieldByName('FieldWidth').Value:=DBGridEh1.Columns[i].Width;
        DM.Ado849s.FieldByName('IsDisplay').Value:=1;
        DM.Ado849s.Post;
      end;
    end;
    DBGridEh1.Columns[0].Title.Color := clRed;
    DBGridEh1.Columns[0].Title.SortMarker:=smUpEh;
    PreColumn := DBGridEh1.Columns[0];
  finally
    DM.ADS235.EnableControls;
  end;
end;

procedure TFrm_main.BitFieldsVisableClick(Sender: TObject);
var
  i:Integer;
begin
  frmSetFieldName:=TfrmSetFieldName.Create(Application);

  try
    frmSetFieldName.rkey419:= Rk419;
    if frmSetFieldName.ShowModal=mrok then
    begin
      try
        DM.ADS235.DisableControls;
        DM.Ado0849.Close;
        DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
        DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
        DM.Ado0849.Prepared;
        DM.Ado0849.Open;
        DM.CDS2.Data:=DM.DSP2.Data;
        if (not DM.CDS2.IsEmpty) then
        begin
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;

//          DBGridEh1.Columns.Add.FieldName:=DM.ADS567.Fields.Fields[0].FieldName;
//          DBGridEh1.Columns[0].Title.Caption:='选择';
//          DBGridEh1.Columns[0].Width:=35;
          i:=0;
          dm.CDS2.First;
          while not DM.CDS2.Eof do
          begin
            if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
            begin
              DBGridEh1.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
              DBGridEh1.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
              DBGridEh1.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
              DBGridEh1.Columns[i].Visible:=True;
              Inc(i);
              dm.CDS2.Next;
            end
            else
            begin
              dm.CDS2.Next;
            end;
          end;
        end;

        for i:=0 to DBGridEh1.Columns.Count-1 do
        if fName=DBGridEh1.Columns[i].FieldName then
        begin
          DBGridEh1.Columns[i].Title.Color := clRed;
          PreColumn := DBGridEh1.Columns[i];
        end;
        for i:=0 to DBGridEh1.Columns.Count-1 do
        if sName=DBGridEh1.Columns[i].FieldName then
        begin
          if smsort=0 then
          begin
            DBGridEh1.Columns[i].Title.SortMarker := smUpEh;
          end
          else
          begin
            DBGridEh1.Columns[i].Title.SortMarker := smDownEh;
          end;
        end;
      finally
        DM.ADS235.EnableControls;
      end;
    end;
  finally
    frmSetFieldName.Free;
  end;

end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    smsort := 0;
    sName := Column.FieldName;
    column.Title.SortMarker := smUpEh;
    dm.ADS235.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    smsort := 1;
    sName := Column.FieldName;
    column.Title.SortMarker:=smDownEh;
    dm.ADS235.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
//    indexColumn := Column.Index;

    fName :=  Column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure TFrm_main.BitCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_main.BitRefreshClick(Sender: TObject);
var
  rkey235:integer;
begin
  rkey235:=dm.ADS235RKEY.Value;
  dm.ADS235.Close;
  dm.ADS235.Prepared;
  dm.ADS235.Open;
  if rkey235>0 then
  dm.ADS235.Locate('rkey',rkey235,[]);
end;

procedure TFrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS235.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;


procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
//  self.Caption:=application.Title;
// rkey73:='2551';
// user_ptr := '3054';
// vprev := '4'

end;



procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS235.CommandText);
end;



procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS235.Close;
    dm.ADS235.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    if frmQuerySet.CheckBox1.Checked=true then
      ssql:=ssql+' AND dbo.Data0235.QUAN_ON_HAND > 0'+ #13;
    dm.ADS235.CommandText := sql_text+ssql+' and (Data0456.ship_DATE  >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (Data0456.ship_DATE  <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';;
    dm.ADS235.Open;
  end;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
  else
  try
    Frm_detail:=TFrm_detail.Create(application);
    Frm_detail.ADS209.Close;
    Frm_detail.ADS209.CommandText := Frm_detail.ADS209.CommandText+' where data0235.rkey ='+DM.ADS235RKEY.asstring;
    Frm_detail.ADS209.Open;
    if Frm_detail.ShowModal = mrOk then
  finally
    Frm_detail.free;
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
  else
  try
    frm_return_quan:=Tfrm_return_quan.Create(application);
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'select quan_on_hand from data0235 where rkey = '+dm.ADS235RKEY.AsString;
      Open;
    end;
    frm_return_quan.Edit1.Text := formatfloat('0.000',DM.tmp.FieldByName('quan_on_hand').Value);
    if frm_return_quan.ShowModal=mrok then
    begin
      BitRefreshClick(Sender);
    end;
  finally
    frm_return_quan.free;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADS235QUAN_ON_HAND.Value>0 then
  begin
    N1.Enabled := True;
  end
  else
  begin
    N1.Enabled := False;
  end;
  if DM.ADS235.RecordCount >0 then
  begin
    N2.Enabled := True;
  end
  else
  begin
    N2.Enabled := False;
  end;
end;

end.
