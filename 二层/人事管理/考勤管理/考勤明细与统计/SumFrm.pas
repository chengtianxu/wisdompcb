unit SumFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, ComCtrls, TeEngine,
  TeeProcs, Chart, ExtCtrls, DMFrm, DB, ADODB, Series, DBChart, Menus, Grids;

type
  TfrmSum = class(TForm)
    tvDepart: TTreeView;
    pnl1: TPanel;
    pnl2: TPanel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    lbl1: TLabel;
    btnSearch: TButton;
    eh1: TDBGridEh;
    dsSum: TDataSource;
    qrySum: TADOQuery;
    strngfldfieldbm: TStringField;
    dtfld1: TDateField;
    intgrfld1: TIntegerField;
    fltfld1: TFloatField;
    fltfld2: TFloatField;
    cbb1: TComboBox;
    lbl2: TLabel;
    cht1: TChart;
    sr1: TBarSeries;
    sr2: TBarSeries;
    pm1: TPopupMenu;
    EXCEL1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure tvDepartDblClick(Sender: TObject);
  private
    { Private declarations }
    FDepartNodeArr: array of TTreeNode;
    FSelectDepart: string;    
    procedure AddChartData();

    procedure FillDepartTree;
    function GetSelectDepart: string;    
  public
    { Public declarations }
  end;

  function ShowSumFrm(AOwner: TComponent): Boolean;
implementation

uses
  DateUtils, WZ_gUnit;

{$R *.dfm}
function GetChildNode(ANode: TTreeNode): string;
var
  I: Integer;
begin
  Result := IntToStr(Integer(ANode.Data));
  if ANode.HasChildren then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      Result := Result + ',' + GetChildNode(ANode.Item[I]);
    end;
  end;
end;

function ShowSumFrm(AOwner: TComponent): Boolean;
var
  frmSum: TfrmSum;
begin
  frmSum := TfrmSum.Create(AOwner);
  try
    Result := frmSum.ShowModal = mrOk;
  finally
    frmSum.Free;
  end;
end;

procedure TfrmSum.AddChartData;
var
  LOldTime: TDateTime;
  Y,Y2: Integer;
begin
  if not qrySum.Active then Exit;
  LOldTime := 0;
  Y := 0;
  Y2 := 0;
  sr1.Clear;
  sr2.Clear;
  sr1.XValues.DateTime := True;
  sr2.XValues.DateTime := True;
  case cbb1.ItemIndex of
    0:
    begin
      //sr2.Visible := False;
      sr1.Title := '出勤人数';
      sr2.Title := ' ';
      try
        qrySum.DisableControls;
        qrySum.First;
        while not qrySum.Eof do
        begin
          if LOldTime = 0 then LOldTime := qrySum.FieldByName('日期').AsDateTime;
          if LOldTime <> qrySum.FieldByName('日期').AsDateTime then
          begin
            sr1.AddXY(LOldTime,Y,'');
            LOldTime := qrySum.FieldByName('日期').AsDateTime;
            Y := 0;
            Y := Y + qrySum.FieldByName('出勤人数').asinteger;
          end else
          begin
            Y := Y + qrySum.FieldByName('出勤人数').asinteger;
          end;
          qrySum.Next;
          if qrySum.Eof then
            sr1.AddXY(qrySum.FieldByName('日期').AsDateTime,Y,'');
        end;
      finally
        qrySum.EnableControls;
      end;
      qrySum.First;
    end;
    1:begin
      sr1.Title := '正班';
      sr2.Title := '加班';
      try
        qrySum.DisableControls;
        qrySum.First;
        while not qrySum.Eof do
        begin
          if LOldTime = 0 then LOldTime := qrySum.FieldByName('日期').AsDateTime;
          if LOldTime <> qrySum.FieldByName('日期').AsDateTime then
          begin
            sr1.AddXY(LOldTime,Y,'');
            sr2.AddXY(LOldTime,Y2,'');
            LOldTime := qrySum.FieldByName('日期').AsDateTime;
            Y := 0;
            Y2 := 0;
            Y := Y + qrySum.FieldByName('正班').asinteger;
            Y2 := Y2 + qrySum.FieldByName('加班').asinteger;
          end else
          begin
            Y := Y + qrySum.FieldByName('正班').asinteger;
            Y2 := Y2 + qrySum.FieldByName('加班').asinteger;
          end;
          qrySum.Next;
          if qrySum.Eof then
          begin
            sr1.AddXY(qrySum.FieldByName('日期').AsDateTime,Y,'');
            sr2.AddXY(qrySum.FieldByName('日期').AsDateTime,Y2,'');
          end;
        end;
      finally
        qrySum.EnableControls;
      end;
      qrySum.First;
    end;
  else
    ;
  end;
end;

procedure TfrmSum.btnSearchClick(Sender: TObject);
var
  tmpS: string;
begin
  if Trim(FSelectDepart) = '' then
  begin
    ShowMessage('请选择要查询的部门');
    Exit;
  end;
  tmpS := 'SELECT d5.departmentname AS ''部门名称'',D1.CheckDate AS ''日期'', SUM (CASE WHEN ( ' +
    ' OnDutyTime1 IS NOT NULL OR OffDutyTime1 IS NOT NULL ' +
    ' OR OnDutyTime2 IS NOT NULL OR OffDutyTime2 IS NOT NULL ' +
    ' OR OnDutyTime3 IS NOT NULL OR OffDutyTime3 IS NOT NULL ' +
    ' OR OnDutyTime4 IS NOT NULL OR OffDutyTime4 IS NOT NULL ' +
    ' ) THEN 1 ELSE 0 END) AS ''出勤人数'', ' +
    ' SUM(ISNULL(RWT,0)) AS ''正班'', SUM(ISNULL(ROT,0)) AS ''加班'' FROM OnOffDutyData D1 ' +
    ' INNER JOIN employeemsg d2 ON d1.EmployeeID = d2.Rkey ' +
    ' INNER JOIN datadepartment d5 ON d2.departmentid = d5.RKey ' +
    ' WHERE D1.CheckDate BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',dtpBegin.Date)) + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',dtpEnd.Date)) +
    ' AND D5.rkey in ' + GetSelectDepart +
    ' GROUP BY D1.CheckDate,d2.departmentid,d5.departmentname ' +
    ' ORDER BY D1.CheckDate ASC';

   qrySum.Close;
   qrySum.Connection := DM1.con1;
   qrySum.SQL.Clear;
   qrySum.SQL.Add(tmpS);
   qrySum.Open;
   cht1.Title.Text.Add(tvDepart.Selected.Text); 
   AddChartData;

end;

procedure TfrmSum.cbb1Change(Sender: TObject);
begin
  AddChartData;
end;

procedure TfrmSum.EXCEL1Click(Sender: TObject);
begin
  if qrySum.Active then
    WZ_gUnit.Export_dbGridEH_to_Excel(eh1,'');
end;

procedure TfrmSum.FillDepartTree;
var
  LSql: string;
  LParnentNode: TTreeNode;
  I: Integer;
begin
  SetLength(FDepartNodeArr,0);
  tvDepart.Items.Clear;
  LParnentNode := nil;
  LSql := ' ;WITH tmp(departmentname,Lv,rkey,superior) AS ' +
          ' (SELECT departmentname,1,rkey,superior FROM datadepartment WHERE (superior = 0 or superior is null) ' +
          ' UNION ALL ' +
          ' SELECT D2.departmentname,tmp.Lv+1,D2.RKey,D2.superior FROM datadepartment D2 ' +
          ' INNER JOIN tmp ON D2.superior = tmp.RKey ) ' +
          ' SELECT * FROM tmp ORDER BY lv ' ;
  if DM1.SqlOpen(LSql) then
  begin
    DM1.qrytmp.First;
    while not DM1.qrytmp.Eof do
    begin
      if DM1.qrytmp.FieldByName('superior').AsInteger = 0 then
        LParnentNode := nil
      else
      begin
        for I := 0 to Length(FDepartNodeArr) - 1 do
        begin
          if Integer(FDepartNodeArr[I].Data) = DM1.qrytmp.FieldByName('superior').AsInteger then
            LParnentNode := FDepartNodeArr[I];
        end;
      end;
      SetLength(FDepartNodeArr,Length(FDepartNodeArr)+1);
      FDepartNodeArr[High(FDepartNodeArr)] :=
        tvDepart.Items.AddChildObject(LParnentNode,DM1.qrytmp.fieldbyname('departmentname').AsString,Pointer(DM1.qrytmp.FieldByName('rkey').asinteger));
      DM1.qrytmp.Next;
    end;
  end;
end;

procedure TfrmSum.FormShow(Sender: TObject);
begin
  dtpBegin.Date := IncDay(Now,-3);
  dtpEnd.DateTime := Now;
  FillDepartTree;
end;

function TfrmSum.GetSelectDepart: string;
begin
  Result := '(-1,' + GetChildNode(tvDepart.Selected) + ')';
end;

procedure TfrmSum.tvDepartDblClick(Sender: TObject);
var
  LP: TPoint;
  LItem: TTreeNode;
begin
  LP := tvDepart.ScreenToClient(Mouse.CursorPos);
  LItem := tvDepart.GetNodeAt(LP.X,LP.Y);
  if Assigned(LItem) then
  begin
    FSelectDepart := GetSelectDepart;
  end;
end;

end.
