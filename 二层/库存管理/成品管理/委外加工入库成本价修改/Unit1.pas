//---------------------------------------------
//                   _ooOoo_
//                  o8888888o
//                  88" . "88
//                  (| -_- |)
//                  O\  =  /O
//               ____/`---'\____
//             .'  \\|     |//  `.
//            /  \\|||  :  |||//  \
//           /  _||||| -:- |||||-  \
//           |   | \\\  -  /// |   |
//           | \_|  ''\---/''  |   |
//           \  .-\__  `-`  ___/-. /
//         ___`. .'  /--.--\  `. . __
//      ."" '<  `.___\_<|>_/___.'  >'"".
//     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//     \  \ `-.   \_ __\ /__ _/   .-` /  /
//      `-.____`-.___\_____/___.-`____.-'
//                   `=---='
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//    佛祖保佑       永无BUG       永不修改
//---------------------------------------------
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, ExtCtrls, ADODB, Buttons, ComCtrls,
  StdCtrls, Menus, common,DateUtils;

type
  TForm1 = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    pnl1: TPanel;
    pnl2: TPanel;
    DBGridEh1: TDBGridEh;
    ds1: TDataSource;
    qry1RKEY60: TAutoIncField;
    qry1RKEY53: TAutoIncField;
    qry1DSDesigner: TStringField;
    qry1DSDesigner2: TStringField;
    qry1DSDesigner3: TStringField;
    qry1DSDesigner4: TStringField;
    qry1DSDesigner5: TStringField;
    qry1DSDesigner6: TStringField;
    qry1DSDesigner7: TFloatField;
    qry1DSDesigner9: TDateTimeField;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btn1: TSpeedButton;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    btnQuery: TBitBtn;
    BitBtn2: TBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    lblFilter: TLabel;
    edtFilter: TEdit;
    BitBtn1: TBitBtn;
    qry1DSDesigner8: TFloatField;
    qryExec: TADOStoredProc;
    qry1ABBR_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;      
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ExcelImport;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  Query:TAdoquery;
  sortDate:TDateTime;
begin
{$IFDEF Release}
  if not App_init_2(con1) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
//  con1.connectionstring:='Provider=SQLOLEDB.1;Password=WisDomPCB_WUZHOU;Persist Security Info=True;User ID=sa;Initial Catalog=wisdompcb;Data Source=172.17.0.187';
  con1.Connected:= False;
  con1.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='2444';
{$ENDIF}
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
  //jacky zhong 2015-6-1日期默认从本月1号到当日
  Query:=TAdoquery.create(self);
  try
    Query.Connection:=con1;
    Query.SQL.Add('select getdate() as v_date');
    Query.Open;
    sortDate:=Query.FieldValues['v_date'];
    dtp1.Date:=sortDate-dayof(sortDate)+1;
    dtp3.Date:=sortDate;
  finally
    Query.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//  if con1.Connected then
//  begin
//
//  end;
  Field_Name:= DBGridEh1.Columns[0].FieldName;
  PreColumn:= DBGridEh1.Columns[0];
end;

procedure TForm1.N1Click(Sender: TObject);
var
  InputString: string;
  i: Double;
  label ReInput;
begin   
  if ((vprev<>'2') and (vprev<>'4')) then
  begin
    ShowMessage('您没有写入权限');
    Abort;
  end;
  IF not ds1.DataSet.Active then
  begin
    ShowMessage('请先查询数据');
    Abort;
  end;
  if ds1.DataSet.RecordCount=0 then Exit;
  InputString:= qry1.FieldByName('成本').AsString;
  ReInput: if InputQuery('修改', '成本价：', InputString) then
  begin
    if not TryStrToFloat(Trim(InputString),i) then
    begin
        Application.MessageBox('您输入的不是数字，请重新输入。',
          '错误提示', MB_OK + MB_ICONSTOP);
        goto ReInput;
    end;
    try
      with qryExec do
      begin
        Close;
        Parameters.ParamByName('@rkey53').Value:= qry1.FieldByName('RKEY53').AsInteger;
        Parameters.ParamByName('@price').Value:= i;
        ExecProc;
      end;
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        Abort;
      end;
    end;
    btnQueryClick(Sender);
  end;                    
end;

procedure TForm1.btnQueryClick(Sender: TObject);
begin
//  ShowMessage(DateToStr(dtp1.DateTime)+' '+TimeToStr(dtp2.DateTime));
//  ShowMessage(DateToStr(dtp3.DateTime)+' '+TimeToStr(dtp4.DateTime));
  Screen.Cursor:=crSQLWait;
  with qry1 do
//  with adoquery1 do
  begin
    Close;
    Parameters.ParamByName('BDate').Value:= StrToDateTime(DateToStr(dtp1.DateTime)+' '+TimeToStr(dtp2.DateTime));
    Parameters.ParamByName('EDate').Value:= StrToDateTime(DateToStr(dtp3.DateTime)+' '+TimeToStr(dtp4.DateTime));
    Open;
    Screen.Cursor:=crDefault;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, self.Caption);
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((ds1.DataSet as TADOQuery).SQL.Text, mtInformation, [mbOK], 0);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  IF ds1.DataSet.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      qry1.Sort:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      qry1.Sort:= Column.FieldName + ' DESC';
    end;
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lblFilter.Caption:= Column.Title.Caption;
      edtFilter.Text:= '' ;
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询 ');
end;

procedure TForm1.edtFilterChange(Sender: TObject);
var
  S: String;
begin
  IF ds1.DataSet.Active Then
  begin
    qry1.Filter := '';
    S:= '';

    if trim(edtFilter.text) <> '' then
    begin
      if qry1.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if qry1.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtFilter.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtFilter.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtFilter.text);
        except
          ShowMessage('输入的内容不相符，只能输入数字！');
        end;
      end;
    end;
    qry1.Filter:= S;
    
    if qry1.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      Exit;
    end;
  end;
end;

procedure TForm1.DBGridEh1DblClick(Sender: TObject);
begin
  if DBGridEh1.SelectedField = qry1DSDesigner8 then
  N1.Click;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if ((vprev<>'2') and (vprev<>'4')) then
  begin
    ShowMessage('您没有写入权限');
    Abort;
  end;
  Application.CreateForm(TfrmExcelImport, frmExcelImport);
  frmExcelImport.ShowModal;
end;

end.
