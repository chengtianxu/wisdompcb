unit ReqView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DMFrm, DB, ADODB, 
  DBGridEh, Buttons, ComCtrls, Menus, Grids;

type
  TfrmReqView = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    edtGX: TLabeledEdit;
    cbxType: TComboBox;
    btnSearch: TSpeedButton;
    dbgrd1: TDBGridEh;
    ds1: TDataSource;
    dsReqView: TADODataSet;
    btnHZ: TSpeedButton;
    dbgrd2: TDBGridEh;
    qrySum: TADOQuery;
    ds2: TDataSource;
    pm1: TPopupMenu;
    Excel1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumnEh);
    procedure btnHZClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  function ShowReqView(AOwner: TComponent): Integer;

implementation

uses
  DateUtils, WZ_gUnit;

{$R *.dfm}

function ShowReqView(AOwner: TComponent): Integer;
begin
  with TfrmReqView.Create(AOwner) do
  begin
    try
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;


procedure TfrmReqView.btnHZClick(Sender: TObject);
var
  LSql: string;
begin
  if dsReqView.Active then dsReqView.Close;
  if qrySum.Active then qrySum.Close;
  dbgrd1.Visible := False;
  dbgrd2.Visible := True;
  LSql := ' SELECT t.departmentname as 部门,COUNT(t.employeecode) AS 次数, t.employeecode AS 工号, t.chinesename AS 姓名,' +
          ' (case t.reqtype when 0 then ''补卡'' when 1 then ''请假'' when 2 then ''修改工时'' end ) as 类型 ' +
          ' from(SELECT  depart.departmentname,d2.employeecode, d2.chinesename, d1.reqtype ' +
          ' FROM Req d1 INNER JOIN employeemsg d2 ON d1.employeeid = d2.rkey  ' +
          ' INNER JOIN datadepartment depart ON d2.departmentid = depart.RKey  ' ;
  if cbxType.ItemIndex in [0,2] then
    LSql := LSql + ' WHERE d1.req_cardtime BETWEEN ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.Time))) + ' AND ' + QuotedStr(WZ_gUnit.gDateTimeToStr(IncSecond(IncDay(DateOf(dtp2.Time)),-1))) + ' AND d1.reqtype= ' + IntToStr(cbxType.ItemIndex)
  else
    LSql := LSql + ' WHERE d1.req_cardtime BETWEEN ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.Time))) + ' AND ' + QuotedStr(WZ_gUnit.gDateTimeToStr(IncSecond(IncDay(DateOf(dtp2.Time)),-1))) + ' AND d1.reqtype= ' + IntToStr(cbxType.ItemIndex);
  LSql := LSql + ' AND D1.ReqState = 2 ' +
          ' ) t GROUP BY t.employeecode,t.chinesename,t.reqtype,t.departmentname ';
  if Length(Trim(edtGX.Text)) > 0 then
    LSql := LSql + ' HAVING t.employeecode=' + QuotedStr(edtGX.Text);

  qrySum.Close;
  qrySum.Connection := DM1.con1;
  qrySum.SQL.Clear;
  qrySum.SQL.Add(LSql);
  qrySum.Open;
end;

procedure TfrmReqView.btnSearchClick(Sender: TObject);
var
  s: string;
begin
  if dsReqView.Active then dsReqView.Close;
  if qrySum.Active then qrySum.Close;
  dbgrd1.Visible := True;
  dbgrd2.Visible := False;
  try
    s := 'SELECT  depart.departmentname as 部门,d2.employeecode as 工号, d2.chinesename as 姓名,   (case reqstate when 0 then ''未提交'' when 1 then ''已提交'' when 2 then ''已审核'' when 3 then ''退回'' end) as 状态,';
    s := s + ' reqinfo as 备注, reqperson as 提交人, reqtime as 提交时间, (case reqtype when 0 then ''补卡'' when 1 then ''请假'' when 2 then ''修改工时'' end ) as 类型, req_cardtime as 时间, req_starttime as 始,';
    s := s + ' req_endtime as 终, zbhour as 正班, jbhour as 加班, dealperson as 受理人, dealtime as 受理时间 FROM Req d1 INNER JOIN employeemsg d2 ON d1.employeeid = d2.rkey ';
    s := s + ' INNER JOIN datadepartment depart ON d2.departmentid = depart.RKey  ';
    if cbxType.ItemIndex in [0,2] then
      s := s + ' WHERE req_cardtime BETWEEN :FBeginTime  AND :FEndTime  AND ReqState = :FReqState AND reqtype = :FReqType'
    else
      s := s + ' WHERE Reqtime BETWEEN :FBeginTime  AND :FEndTime AND ReqState = :FReqState AND reqtype = :FReqType' ;
    if Length(Trim(edtGX.Text)) > 0 then s := s + ' AND d2.employeecode = ' + edtGX.Text;
    dsReqView.CommandText := s;
    dsReqView.Parameters.ParamValues['FBeginTIme'] := DateOf(dtp1.Time);
    dsReqView.Parameters.ParamValues['FEndTime'] := IncSecond(IncDay(DateOf(dtp2.Time),1),-1);
    dsReqView.Parameters.ParamValues['FReqState'] := 2;
    dsReqView.Parameters.ParamValues['FReqType'] := cbxType.ItemIndex;
    dsReqView.Open;
  except
  end;
end;

procedure TfrmReqView.dbgrd1TitleClick(Column: TColumnEh);
begin
  if not Column.Field.DataSet.IsEmpty then
  begin
    if Column.Title.SortMarker = smDownEh then
    begin
      TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
      Column.Title.SortMarker := smUpEh;
    end
    else if Column.Title.SortMarker = smUpEh then
    begin
      TCustomAdoDataSet(Column.Field.DataSet).Sort :='';
      Column.Title.SortMarker := smNoneEh;
    end
    else if Column.Title.SortMarker = smNoneEh then
    begin
      TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
      Column.Title.SortMarker := smDownEh;
    end;
  end;
end;

procedure TfrmReqView.Excel1Click(Sender: TObject);
begin
  if ds1.DataSet.Active then
    WZ_gUnit.Export_dbGridEH_to_Excel(dbgrd1,'')
  else
    WZ_gUnit.Export_dbGridEH_to_Excel(dbgrd2,'');
end;

procedure TfrmReqView.FormShow(Sender: TObject);
begin
  dtp1.DateTime := IncDay(Now,-2);
  dtp2.DateTime := Now;
end;

end.
