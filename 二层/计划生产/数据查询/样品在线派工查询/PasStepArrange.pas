unit PasStepArrange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, Buttons, ExtCtrls, Menus, DB,
  DBGridEh;

type
  TFrmStepArrange = class(TForm)
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    Button1: TButton;
    DataSource1: TDataSource;
    BitBtn7: TBitBtn;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    N2: TMenuItem;
    N3: TMenuItem;
    WIP1: TMenuItem;
    N4: TMenuItem;
    DBGridEh2: TDBGridEh;
    PopupMenu3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    BitBtn8: TBitBtn;
    Button2: TButton;
    N9: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure item_click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure WIP1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    Sqlstr:string;
    sSQLTxt:string;
    rkey419:Integer;
    FaWidth:array[0..79] of integer;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    Rk419:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStepArrange: TFrmStepArrange;
  str_list:TStringList;

implementation
uses common, PasDM, PasStepDate, PasQuery, pasSetFieldName,
  PasUpdateLevel, ManuPart_WIP, WO_INFO, PasStepPause, PasBatchPause,
  PasAllPause, PasCollect2, PasPowerMX, PasBackMX;
{$R *.dfm}

procedure TFrmStepArrange.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh2.FieldCount - 1 do
    if DBGridEh2.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh2.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh2.FieldCount - 1 do
    if DBGridEh2.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh2.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrmStepArrange.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmStepArrange.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  frmStepDate:=TfrmStepDate.Create(application);
  frmStepDate.ShowModal;
  frmStepDate.Free;
end;

procedure TFrmStepArrange.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=Application.Title;

// rkey73:='1593';
// user_ptr := '2998';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TFrmStepArrange.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh2,self.Caption);
end;

procedure TFrmStepArrange.BitBtn4Click(Sender: TObject);
begin
  PopupMenu3.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmStepArrange.FormShow(Sender: TObject);
var j,i:Integer;
    strPJ:string;
  item:TMenuItem;
  LColumn:TDBGridColumnEh;
  LField:TField;
begin
  sSQLTxt:=dm.Ado587.SQL.Text;
  DBGridEh2.ReadOnly:=True;
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    if not IsEmpty then
      Rk419:=FieldByName('rkey').AsInteger
    else
      Rk419:=-1;//2570;
  end;
  StartDate:=getsystem_date(DM.tmp,1)-3;
  EndDate:=getsystem_date(DM.tmp,1);
//  ShowMessage(IntToStr(Rk419));
  Sqlstr:=' and d06.work_order_number=''nnnn''';
  DM.Ado587.Close;
  DM.Ado587.SQL.Text:=sSQLTxt+Sqlstr+' order by data0283.iSort,WL,d34.DEPT_CODE,LaveDate34';
  DM.Ado587.Open;
  try
    DM.Ado0849.Close;
    DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
    DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
    DM.Ado0849.Prepared;
    DM.Ado0849.Open;
    if (not DM.Ado0849.IsEmpty) then
    begin
      DM.CDS2.Data:=DM.DSP2.Data;
      if (DBGridEh2.FieldCount<>DM.Ado0849.RecordCount) then
      begin
        dm.tmp.Close;
        dm.tmp.SQL.Text:='delete from data0849 where D419_ptr='+inttostr(Rk419)+' and D073_ptr='+rkey73+'';
        dm.tmp.ExecSQL;
      end else
      begin
        for i:=DBGridEh2.Columns.Count downto 1 do
        begin
          DBGridEh2.Columns.Delete(i-1);
        end;
        dm.CDS2.First;
        dm.CDS2.IndexFieldNames:='FieldOrder';
        dm.CDS2.Filtered:=True;
        i:=0;
        while not DM.CDS2.Eof do
        begin
          if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
          begin
            DBGridEh2.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
            DBGridEh2.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
            DBGridEh2.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
            Inc(i);
            dm.CDS2.Next;
          end else dm.CDS2.Next;
        end;
        dm.CDS2.Filtered:=False;
      end;
    end else //没有849，保存
    begin
      dm.Ado849s.Close;
      dm.Ado849s.Open;
      for i:=0 to DBGridEh2.FieldCount-1 do
      begin
        DM.Ado849s.Append;
        DM.Ado849s.FieldByName('D419_ptr').Value:=Rk419;
        DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
        DM.Ado849s.FieldByName('FormName').Value:='FrmStepArrange';
        DM.Ado849s.FieldByName('GridName').Value:='DBGridEh1';
        DM.Ado849s.FieldByName('FieldName').Value:=DBGridEh2.Columns[i].FieldName;;
        DM.Ado849s.FieldByName('FieldCaption').Value:=DBGridEh2.Columns[i].Title.Caption;
        DM.Ado849s.FieldByName('FieldOrder').Value:=i;
        DM.Ado849s.FieldByName('FieldWidth').Value:=DBGridEh2.Columns[i].Width;
        DM.Ado849s.FieldByName('IsDisplay').Value:=1;
        DM.Ado849s.Post;
      end;
    end;
    field_name := DBGridEh2.Columns[0].FieldName;
    PreColumn := DBGridEh2.Columns[0];
    DBGridEh2.Columns[0].Title.Color := clred ;

    DBGridEh2.FooterRowCount:=1;
    DBGridEh2.SumList.Active:=True;

    for i:=0 to DBGridEh2.Columns.Count-1 do
    begin
      if (DBGridEh2.Columns[i].FieldName='投产数量') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Footer.FieldName:='投产数量';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Title.Caption:='投产数量';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Width:=68;
      end;
      if (DBGridEh2.Columns[i].FieldName='在线数量PCS') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Footer.FieldName:='在线数量PCS';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Title.Caption:='在线数量PCS';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Width:=68;
      end;
      if (DBGridEh2.Columns[i].FieldName='在线数量PANEL') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Footer.FieldName:='在线数量PANEL';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Title.Caption:='在线数量PANEL';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Width:=70;
      end;
      if (DBGridEh2.Columns[i].FieldName='wip_area') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Footer.FieldName:='wip_area';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Title.Caption:='面积';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Width:=70;
      end;
      if (DBGridEh2.Columns[i].FieldName='QUAN_PROD') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Footer.FieldName:='QUAN_PROD';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Title.Caption:='完工入库数量';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Width:=68;
      end;
      if (DBGridEh2.Columns[i].FieldName='QUAN_REJ') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Footer.FieldName:='QUAN_REJ';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Title.Caption:='报废数量';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Width:=68;
      end;
      if (DBGridEh2.Columns[i].FieldName='TO_BE_STOCKED') then
      begin
        DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Footer.FieldName:='TO_BE_STOCKED';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Footer.ValueType:=fvtSum;
        DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Title.Caption:='待入库数量';
        DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Width:=68;
      end;
    end;
  finally

  end;
end;

procedure TFrmStepArrange.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    FrmQuery.DTPk1.Date:= StartDate
  else
    FrmQuery.DTPk1.Date:=getsystem_date(DM.tmp,1)-3;
  if EndDate > 100 then
    FrmQuery.DTPk2.Date:= EndDate
  else
    FrmQuery.DTPk2.Date:=getsystem_date(DM.tmp,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    DM.Ado587.DisableControls;
    screen.Cursor:=crHourGlass;
    iNo:=0;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      StartDate:=FrmQuery.DTPk1.Date;
      EndDate:=FrmQuery.DTPk2.Date;
      DM.Ado587.Close;
      DM.Ado587.SQL.Text:=sSQLTxt+Sqlstr+' order by data0283.iSort,WL,d34.DEPT_CODE,LaveDate34';
      DM.Ado587.Open;
      if (not DM.Ado587.IsEmpty) then
      begin
        ListDEPT:=TStringList.Create;
        ListDEPT.Clear;
        DM.Ado587.First;
        for i :=0  to DM.Ado587.RecordCount-1 do
        begin
          ListDEPT.Add(DM.Ado587.FieldValues['DEPT_PTR']);
          DM.Ado587.Next;
        end;
        try
          ListDEPT.Sort;
          ListDEPT2:=TStringList.Create;
          ListDEPT2.Sorted:=True;
          ListDEPT2.Duplicates:=dupIgnore;
          ListDEPT.BeginUpdate;
          for i :=0  to ListDEPT.Count-1 do
          begin
            ListDEPT2.Add(ListDEPT[i]);
          end;
          ListDEPT2.EndUpdate;
          ListDEPT.Assign(ListDEPT2);
        finally
          ListDEPT2.Free;
        end;
        DM.Ado587.First;
      end;
    finally
      DM.Ado587.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TFrmStepArrange.BitBtn3Click(Sender: TObject);
begin
  DM.Ado587.DisableControls;
  DM.Ado587.Close;
  DM.Ado587.SQL.Text:=sSQLTxt+Sqlstr+' order by data0283.iSort,WL,d34.DEPT_CODE,LaveDate34';
  DM.Ado587.Open;
  DM.Ado587.EnableControls;
end;

procedure TFrmStepArrange.Button1Click(Sender: TObject);
begin
//  if (strtoint(vprev)<>4)  then
//  begin
//    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
//    Exit;
//  end;
//  frmModifyHour:=TfrmModifyHour.Create(application);
//  frmModifyHour.ShowModal;
//  frmModifyHour.Free;
end;

procedure TFrmStepArrange.BitBtn7Click(Sender: TObject);
var i:Integer;
begin
  frmSetFieldName:=TfrmSetFieldName.Create(Application);
  try
    frmSetFieldName.rkey419:= Rk419;
    if frmSetFieldName.ShowModal=mrok then
    begin
      try
        DM.Ado587.DisableControls;
        DM.Ado0849.Close;
        DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rk419;
        DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
        DM.Ado0849.Prepared;
        DM.Ado0849.Open;
        DM.CDS2.Data:=DM.DSP2.Data;
        if (not DM.CDS2.IsEmpty) then
        begin
          for i:=DBGridEh2.Columns.Count downto 1 do
          begin
            DBGridEh2.Columns.Delete(i-1);
          end;
          i:=0;
          dm.CDS2.First;
          while not DM.CDS2.Eof do
          begin
            if (dm.CDS2.fieldByName('IsDisplay').Value=True) then
            begin
              DBGridEh2.Columns.Add.FieldName:=dm.CDS2.fieldByName('FieldName').AsString;
              DBGridEh2.Columns[i].Title.Caption:=dm.CDS2.fieldByName('FieldCaption').AsString;
              DBGridEh2.Columns[i].Width:=dm.CDS2.fieldByName('FieldWidth').AsInteger;
              Inc(i);
              dm.CDS2.Next;
            end else dm.CDS2.Next;
          end;
          DBGridEh2.FooterRowCount:=1;
          DBGridEh2.SumList.Active:=True;
          for i:=0 to DBGridEh2.Columns.Count-1 do
          begin
            if (DBGridEh2.Columns[i].FieldName='投产数量') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Footer.FieldName:='投产数量';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Title.Caption:='投产数量';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['投产数量'].Index].Width:=68;
            end;
            if (DBGridEh2.Columns[i].FieldName='在线数量PCS') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Footer.FieldName:='在线数量PCS';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Title.Caption:='在线数量PCS';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PCS'].Index].Width:=68;
            end;
            if (DBGridEh2.Columns[i].FieldName='在线数量PANEL') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Footer.FieldName:='在线数量PANEL';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Title.Caption:='在线数量PANEL';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['在线数量PANEL'].Index].Width:=70;
            end;
            if (DBGridEh2.Columns[i].FieldName='wip_area') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Footer.FieldName:='wip_area';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Title.Caption:='面积';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['wip_area'].Index].Width:=70;
            end;
            if (DBGridEh2.Columns[i].FieldName='QUAN_PROD') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Footer.FieldName:='QUAN_PROD';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Title.Caption:='完工入库数量';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_PROD'].Index].Width:=68;
            end;
            if (DBGridEh2.Columns[i].FieldName='QUAN_REJ') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Footer.FieldName:='QUAN_REJ';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Title.Caption:='报废数量';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['QUAN_REJ'].Index].Width:=68;
            end;
            if (DBGridEh2.Columns[i].FieldName='TO_BE_STOCKED') then
            begin
              DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Footer.FieldName:='TO_BE_STOCKED';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Footer.ValueType:=fvtSum;
              DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Title.Caption:='待入库数量';
              DBGridEh2.Columns[DBGridEh2.FieldColumns['TO_BE_STOCKED'].Index].Width:=68;
            end;
          end;
        end;
      finally
        DM.Ado587.EnableControls;
      end;
    end;
  finally
    frmSetFieldName.Free;
  end;
end;

procedure TFrmStepArrange.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado587.IsEmpty) then Exit;
  frmUpdateLevel:=TfrmUpdateLevel.Create(Application);
  Try
    if frmUpdateLevel.ShowModal=mrok then
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='update data0006 set PRIORITY_CODE='+inttostr(frmUpdateLevel.BitBtn2.Tag)+' where rkey='+DM.Ado587.FieldBYName('Rkey').asstring;
      DM.tmp.ExecSQL;
    end;
  finally
    frmUpdateLevel.Free;
  end;
  BitBtn3Click(nil);
end;

procedure TFrmStepArrange.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.Ado587.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.Ado587.Filter:='';
end;

procedure TFrmStepArrange.PopupMenu2Popup(Sender: TObject);
begin
  if (DM.Ado587.IsEmpty) then
  begin
    N1.Enabled:=False;
    N3.Enabled:=False;
    WIP1.Enabled:=False;
    N4.Enabled:=False;
    N8.Enabled:=False;
  end else
  begin
    N1.Enabled:=True;
    N3.Enabled:=True;
    WIP1.Enabled:=True;
    N4.Enabled:=True;
    N8.Enabled:=True;
  end;
end;

procedure TFrmStepArrange.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if not DM.Ado587.IsEmpty then
//  begin
//    if (DBGridEh1.DataSource.DataSet.FieldByName('WL').AsFloat<0)  then
//      DBGridEh1.Canvas.Font.Color := clRed;
//    if ((DBGridEh1.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急') or (DBGridEh1.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急（量）')) then
//      DBGridEh1.Canvas.Font.Color := clFuchsia;
//  end;
//  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmStepArrange.DBGridEh1TitleClick(Column: TColumnEh);
begin
//  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
//     (column.Field.DataType in [ftString,ftWideString])
//      then
//  begin
//    label1.Caption:=column.Title.Caption;
//    edit1.SetFocus;
//    PreColumn.Title.Color := clBtnFace;
//    Column.Title.Color := clred;
//    PreColumn := column;
//  end
//  else edit1.SetFocus;
end;

procedure TFrmStepArrange.WIP1Click(Sender: TObject);
begin
  if frmManuPart_WIP=nil then  frmManuPart_WIP:=TfrmManuPart_WIP.Create(Application);
  frmManuPart_WIP.edt1.Text :=DM.Ado587.FieldBYName('manu_part_number').asstring;
  if frmManuPart_WIP.ShowModal=mrok then
  begin

  end;
end;

procedure TFrmStepArrange.N3Click(Sender: TObject);
begin
  with TfrmWO_INFO.Create(Application)do
  try
    parent_ptr:=dm.ado587PARENT_PTR.Value;
    Enter(dm.Ado587rkey06.Value,dm.ado587Bom_ptr.Value,
          dm.ado587WTYPE.Value);
  finally
    free;
  end;
end;

procedure TFrmStepArrange.N4Click(Sender: TObject);
var
  row:string;
begin
 row:=DM.ado587REFERENCE.Value;
 if InputQuery('信息输入', '请输入在线备注:      ',row) then  //修正点cancel按钮也保存的BUG
 begin
   dm.tmp.Close;
   dm.tmp.SQL.Clear;
   dm.tmp.SQL.Text:='update data0056 set REFERENCE='+QuotedStr(row)+
   ' where rkey='+dm.Ado587rkey56.AsString;
   if dm.tmp.ExecSQL>0 then
    begin
     showmsg('保存成功',1);
     BitBtn3Click(nil);
    end
   else
    showmsg('保存失败,请与管理员系联',1);
 end;
end;

procedure TFrmStepArrange.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(DM.Ado587.SQL.Text);
end;

procedure TFrmStepArrange.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if not DM.Ado587.IsEmpty then
  begin
    if ((DBGridEh2.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急（样）') or (DBGridEh2.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急（量）') or (DBGridEh2.DataSource.DataSet.FieldByName('WL').AsFloat<0)) then
      DBGridEh2.Canvas.Font.Color := clRed;
    if (((DBGridEh2.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急（样）') or (DBGridEh2.DataSource.DataSet.FieldByName('PRIORITY_name').AsString='特急（量）')) and (DBGridEh2.DataSource.DataSet.FieldByName('WL').AsFloat<0)) then
      DBGridEh2.Canvas.Font.Color := clFuchsia; //粉
  end;
  DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmStepArrange.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(DM.Ado587.SQL.Text);
end;

procedure TFrmStepArrange.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrmStepArrange.N8Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado587.IsEmpty) then Exit;
  frmStepPause:=TfrmStepPause.Create(application);
  try
    frmStepPause.d34Rkey.Caption:=DBGridEh2.DataSource.DataSet.FieldValues['DEPT_PTR'];
    frmStepPause.Edit1.Tag:=DM.Ado587rkey06.AsInteger;
    frmStepPause.Edit1.Text:=DM.Ado587.FieldValues['WORK_ORDER_NUMBER'];
    frmStepPause.Edit2.Text:=DM.Ado587.FieldValues['MANU_PART_NUMBER'];
    frmStepPause.Edit3.Text:=DM.Ado587.FieldValues['DEPT_CODE'];
    frmStepPause.Edit4.Text:=DM.Ado587.FieldValues['DEPT_NAME'];
    frmStepPause.Edit5.Text:=DM.Ado587.FieldValues['STEP'];
    if frmStepPause.showmodal=mrok then
    begin
      DBGridEh2.Cursor:=crHourGlass;
      DM.Ado587.Close;
      DM.Ado587.SQL.Text:=sSQLTxt+Sqlstr+' order by data0283.iSort,WL,d34.DEPT_CODE,LaveDate34';
      DM.Ado587.Prepared;
      DM.Ado587.Open;
    end;
    DBGridEh2.Cursor:=crDefault;
  finally
    frmStepPause.Free;
  end;
end;

procedure TFrmStepArrange.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado587.IsEmpty) then Exit;
  FrmBatchPause:=TFrmBatchPause.Create(application);
  try
    FrmBatchPause.Label2.Caption:=DM.Ado587rkey06.asstring;
    if FrmBatchPause.showmodal=mrok then
    begin
      DBGridEh2.Cursor:=crHourGlass;
      DM.Ado587.Close;
      DM.Ado587.SQL.Text:=sSQLTxt+Sqlstr+' order by data0283.iSort,WL,d34.DEPT_CODE,LaveDate34';
      DM.Ado587.Prepared;
      DM.Ado587.Open;
    end;
    DBGridEh2.Cursor:=crDefault;
  finally
    FrmBatchPause.Free;
  end;
end;

procedure TFrmStepArrange.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado587.IsEmpty) then Exit;
  FrmAllPause:=TFrmAllPause.Create(application);
  FrmAllPause.SQLTxt:=DM.Ado587.SQL.Text;
  FrmAllPause.ShowModal;
  FrmAllPause.Free;
end;

procedure TFrmStepArrange.BitBtn8Click(Sender: TObject);
begin
  try
    FrmCollect2:=TFrmCollect2.Create(application);
    screen.Cursor:=crAppstart;
    try
      FrmCollect2.ADOQuery1.DisableControls;
      FrmCollect2.ADOQuery1.Close;
      FrmCollect2.ADOQuery1.SQL.Insert(FrmCollect2.ADOQuery1.SQL.Count-2,Sqlstr);
      FrmCollect2.ADOQuery1.Prepared;
      FrmCollect2.ADOQuery1.open;
      if Trim(Edit1.Text)<>'' then
        FrmCollect2.ADOQuery1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
      else
        FrmCollect2.ADOQuery1.Filter:='';
    finally
      FrmCollect2.ADOQuery1.EnableControls;
    end;
    FrmCollect2.ShowModal;
  finally
    FrmCollect2.Free;
    screen.Cursor:=crDefault;
  end;
end;

procedure TFrmStepArrange.Button2Click(Sender: TObject);
begin
  frmPowerMX:=TfrmPowerMX.Create(application);
  frmPowerMX.ShowModal;
  frmPowerMX.Free;
end;

procedure TFrmStepArrange.N9Click(Sender: TObject);
begin
  if (DM.Ado587.IsEmpty) then Exit;
  frmBackMX:=TfrmBackMX.Create(application);
  frmBackMX.ShowModal;
  frmBackMX.Free;
end;

end.
