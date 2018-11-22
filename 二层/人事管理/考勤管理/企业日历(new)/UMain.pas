unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, DB, ADODB,common, Menus,
  DBGrids;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    pnl2: TPanel;
    Panel2: TPanel;
    lbl1: TLabel;
    cbb_yearMonth: TComboBox;
    ehFC: TDBGridEh;
    dsFC: TDataSource;
    qryFC: TADOQuery;
    dsRT: TDataSource;
    qryRT: TADOQuery;
    qryTemp: TADOQuery;
    Label1: TLabel;
    cbb_SAcc: TComboBox;
    qryRTrkey: TAutoIncField;
    qryRTresttype_name: TWideStringField;
    qryRTcolor: TWideStringField;
    qryRTremark: TWideStringField;
    btn_refresh: TButton;
    btn_exit: TButton;
    pmFC: TPopupMenu;
    mni_add: TMenuItem;
    mni_edit: TMenuItem;
    mni_del: TMenuItem;
    pm_RT: TPopupMenu;
    mni_rAdd: TMenuItem;
    mni_Redit: TMenuItem;
    mni_Rdel: TMenuItem;
    qryFCrkey: TAutoIncField;
    qryFCDSDesigner: TStringField;
    qryFCRestDate: TDateTimeField;
    qryFCresttype_name: TWideStringField;
    qryFCcolor: TWideStringField;
    StringGrid1: TStringGrid;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure cbb_yearMonthChange(Sender: TObject);
    procedure cbb_SAccChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mni_delClick(Sender: TObject);
    procedure mni_RdelClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure mni_editClick(Sender: TObject);
    procedure mni_rAddClick(Sender: TObject);
    procedure mni_ReditClick(Sender: TObject);
    procedure ehRestTypeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ehFCTitleClick(Column: TColumnEh);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
   procedure FreshSGrid(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
      uses  uDM,UFCEdit,URTEdit;
{$R *.dfm}

procedure TfrmMain.FreshSGrid(Sender: TObject);
var
  i:Integer;
begin
  StringGrid1.ColCount   :=5;
  StringGrid1.RowCount   :=2;
    with StringGrid1 do
    begin
          Cells[0,0]:='rkey';
          Cells[1,0]:='序号';
          Cells[2,0]:='假日类型';
          Cells[3,0]:='颜色';
          Cells[4,0]:='备注';
          FixedCols := 2;
          FixedRows := 1;
          ColWidths[0]:= -1;
          ColWidths[1]:=20;
          ColWidths[2]:=70;
          ColWidths[3]:=25;
          ColWidths[4]:=450;
//          DM.Resttypemsg.Close;
//          DM.Resttypemsg.Open;
          if not qryRT.IsEmpty then
          begin
                  i := 1;
                  qryRT.First;
                  while not qryRT.Eof do
                  begin
                       Cells[0,i] := qryRTrkey.AsString;
                       Cells[1,i] := IntToStr(i);
                       Cells[2,i] := qryRTresttype_name.AsString;
                       Cells[3,i] := qryRTcolor.AsString;
                       Cells[4,i] := qryRTremark.AsString;
                       qryRT.Next;
                       i := i + 1;
                       RowCount := RowCount + 1;
                  end;
                  RowCount := RowCount - 1;
          end else begin
              Cells[0,0]:='rkey';
              Cells[1,0]:='序号';
              Cells[2,0]:='假日类型';
              Cells[3,0]:='颜色';
              Cells[4,0]:='备注';
              FixedCols := 2;
              FixedRows := 1;
              ColWidths[0]:= -1;
              ColWidths[1]:=25;
              ColWidths[2]:=70;
              ColWidths[3]:=25;
              ColWidths[4]:=120;
              Cells[0,1]:='';
              Cells[1,1]:='';
              Cells[2,1]:='';
              Cells[3,1]:='';
              Cells[4,1]:='';
          end;
   end;
end;

procedure TfrmMain.btn_exitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btn_refreshClick(Sender: TObject);
begin
 self.qryFC.Filtered:=false;
 if qryFC.Active then qryFC.Close;
 qryFC.Open;
end;

procedure TfrmMain.cbb_yearMonthChange(Sender: TObject);
begin
//    qryFC.Filter:=' convert(varchar(7),restdate,120)='''+trim(cbb_yearMonth.Text)+''' ';
//    qryFC.Filtered:=True;
end;

procedure TfrmMain.cbb_SAccChange(Sender: TObject);
begin
  qryFC.Filter:=' CalendarID='+ IntToStr(Integer(cbb_yearMonth.Items.Objects[cbb_yearMonth.itemindex]));
    qryFC.Filtered:=True;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
 Lsql:string;
begin
//
    if not qryFC.Active then qryFC.Open;
    if not  qryRT.Active then  qryRT.Open;
    FreshSGrid(sender);
   Lsql:='select  checkyearmonth  from  SalaryCheck    order by rkey desc  ';

   if not common.OpenQuery(qryTemp,Lsql) then Exit;

   if not qryTemp.IsEmpty then
   begin
     cbb_yearMonth.Items.Clear;
     qryTemp.First;
     while not qryTemp.Eof do
     begin
     cbb_yearMonth.Items.Add(qryTemp.fieldbyname('checkyearmonth').value);
      qryTemp.Next;
     end;
   end;

  //添加薪资账套
  Lsql:=' select case  when Accountname=''日薪帐'' then 0  '+
			' when Accountname=''月薪6'' then 1   '+
			'  when Accountname=''月薪5.5'' then 2  '+
			'  when Accountname=''月薪5'' then 3  '+
			'  else 14 end as accountid, '+
      ' Accountname  from  salaryaccount  '+
      ' order by accountid    ';

   if not common.OpenQuery(qryTemp,Lsql) then Exit;

   if not qryTemp.IsEmpty then
   begin
     cbb_SAcc.Items.Clear;
     qryTemp.First;
     while not qryTemp.Eof do
     begin
     cbb_SAcc.Items.AddObject(qryTemp.fieldbyname('Accountname').asstring,TObject(qryTemp.fieldbyname('accountid').AsInteger));
      qryTemp.Next;
     end;
   end;



end;

procedure TfrmMain.mni_delClick(Sender: TObject);
var
  Lsql:string;
begin
  if qryFC .IsEmpty  then Exit;

 lsql:='delete from FactoryCalendar where rkey ='+qryfcrkey.AsString;
 if not common.ExecSql(qryTemp,Lsql)  then exit; 
 btn_refreshClick(btn_refresh);
end;

procedure TfrmMain.mni_RdelClick(Sender: TObject);
begin
  if qryRT .IsEmpty  then Exit;
  qryRT.delete;
end;

procedure TfrmMain.mni_addClick(Sender: TObject);
 var
 LFrm: TFrmFCEdit;
begin
   Lfrm:=TFrmFCEdit.create(self);
   try
     Lfrm.FEType:=0 ;
    // Lfrm.FHkey:=qryFC.fieldbyname('rkey').Value;
     if Lfrm.showmodal=mrok then
     btn_refreshClick(btn_refresh);
   finally
   Lfrm.free;
   end;

end;

procedure TfrmMain.mni_editClick(Sender: TObject);
 var
 LFrm: TFrmFCEdit;
begin
   Lfrm:=TFrmFCEdit.create(self);
   try
     Lfrm.FEType:=1 ;
     Lfrm.FHkey:=qryFC.fieldbyname('rkey').Value;
     Lfrm.cbb_SAcc.ItemIndex:=Lfrm.cbb_SAcc.Items.IndexOf(qryFC.FieldByName('账套').asstring);
     Lfrm.cbb_HType.ItemIndex:=Lfrm.cbb_HType.Items.IndexOf(qryFC.FieldByName('resttype_name').asstring);
     Lfrm.dtp_HDate.date:=qryFC.FieldByName('RestDate').value;
     if Lfrm.showmodal=mrok then
     btn_refreshClick(btn_refresh);
   finally
   Lfrm.free;
   end;
end;

procedure TfrmMain.mni_rAddClick(Sender: TObject);
 var
 LFrm: TfrmRTEdit;
begin
   Lfrm:=TfrmRTEdit.create(self);
   try
     Lfrm.FEType:=0 ;
    // Lfrm.FHkey:=qryFC.fieldbyname('rkey').Value;
     if Lfrm.showmodal=mrok then
     btn_refreshClick(btn_refresh);
   finally
   Lfrm.free;
   end;

end;

procedure TfrmMain.mni_ReditClick(Sender: TObject);
 var
 LFrm: TFrmFCEdit;
begin
   Lfrm:=TFrmFCEdit.create(self);
   try
     Lfrm.FEType:=1 ;
     Lfrm.FHkey:=qryFC.fieldbyname('rkey').Value;
//     Lfrm.cbb_SAcc.ItemIndex:=Lfrm.cbb_SAcc.Items.IndexOf(qryFC.FieldByName('账套').asstring);
//     Lfrm.cbb_HType.ItemIndex:=Lfrm.cbb_HType.Items.IndexOf(qryFC.FieldByName('resttype_name').asstring);
//     Lfrm.dtp_HDate.date:=qryFC.FieldByName('RestDate').value;
     if Lfrm.showmodal=mrok then
     btn_refreshClick(btn_refresh);
   finally
   Lfrm.free;
   end;
end;

procedure TfrmMain.ehRestTypeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    (Sender as TDBGridEh).Canvas.Brush.Color:=StringToColor(qryRT.FieldByName('color').AsString);

    (Sender as TDBGridEh).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

//   common.rkey73:='3553';
//   common.user_ptr:='4189';
//   common.vprev:='4';

   if not App_init_2(dm.con1) then
   begin
     showmsg('程序起动失败请联系管理员!',1);
     application.Terminate;
   end;

self.Caption:=application.Title;

end;

procedure TfrmMain.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 (Sender as TDBGrid).Canvas.Brush.Color:=StringToColor(qryRT.FieldByName('color').AsString);
 (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmMain.ehFCTitleClick(Column: TColumnEh);
begin
 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qryfc.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qryfc.Sort:=Column.FieldName+' DESC';
  end;
end;

procedure TfrmMain.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    if (ACol=0) or (ARow=0) then Exit;
       if StringGrid1.cells[3,ARow] <> '' then
       begin
          StringGrid1.Canvas.Brush.Color := StringToColor(StringGrid1.cells[3,ARow]);
          StringGrid1.Canvas.FillRect(StringGrid1.CellRect(3,ARow) ) ;
       end;
end;

end.
