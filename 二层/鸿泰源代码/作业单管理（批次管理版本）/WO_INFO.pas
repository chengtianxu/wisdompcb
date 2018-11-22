unit WO_INFO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, Menus, StdCtrls,AdoDB, ExtCtrls,
  Buttons, DBGridEh, pubfunc;

type
  TfrmWO_INFO = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    DBGrid4: TDBGrid;
    Memo1: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    ts1: TTabSheet;
    pm1: TPopupMenu;
    nN1: TMenuItem;
    dbgrd1: TDBGrid;
    procedure PageControl1Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure nN1Click(Sender: TObject);
    procedure eh1DblClick(Sender: TObject);
  private
    { Private declarations }
    WO_Rkey,prod_rkey:integer;
  public
    procedure Enter(v_Wo_Rkey,v_Prod_rKey:integer);
    { Public declarations }
  end;

var
  frmWO_INFO: TfrmWO_INFO;

implementation
uses dm,MyClass,Route_Param, DB, ShellAPI;
{$R *.dfm}
const
  TmpFileDir = 'c:\tmp\';

procedure TfrmWO_INFO.PageControl1Change(Sender: TObject);
var
  sqlstr:string;
  AdoqryTmp:TAdoQuery;
begin
  sqlstr:='';
  case PageControl1.ActivePageIndex of
    0 :  begin
           Memo1.Clear;
           sqlstr:= 'select t6.FLOW_NO,t6.PROJ_START_DATE,isnull(t5.employee_name,'''') as emp_name '+
                    'from Data0006 t6 left join data0005 t5 '+
                    'on t6.USER_PTR = t5.rkey where t6.RKEY='+IntToStr(WO_Rkey);
           AdoqryTmp:=TAdoQuery.Create(nil);
           with AdoqryTmp do
           begin
             Connection := dmcon.ADOConnection1;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             if FieldByName('FLOW_NO').AsInteger = 1 then  //拆分新增
             begin
               Memo1.Lines.Add('=== 拆分新增于'+fieldbyname('PROJ_START_DATE').asstring+'   经由:'+fieldbyname('emp_name').asstring+' ===');
             end;
           end;

           sqlstr:= ' select data0117.*,data0005.employee_name from data0005,data0117 '+
                    ' where data0117.source_type>1 and data0117.source_ptr='+IntToStr(WO_Rkey)+
                    ' and data0117.empl_ptr=data0005.rkey';
           try
             AdoqryTmp:=TAdoQuery.Create(nil);
             AdoqryTmp.Connection := dmcon.ADOConnection1;
             AdoqryTmp.SQL.Clear;
             AdoqryTmp.SQL.Add(sqlstr);
             AdoqryTmp.Open;
             AdoqryTmp.First;
             with AdoqryTmp do
             while not AdoqryTmp.Eof do begin
                case Fieldbyname('action').asinteger of
                0:   Memo1.Lines.Add('=== 从报废中创建于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                1:   Memo1.Lines.Add('=== 暂停生产于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                2:   Memo1.Lines.Add('=== 恢复生产于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                3:   Memo1.Lines.Add('=== 取消作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                4:   Memo1.Lines.Add('=== 恢复作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                5:   Memo1.Lines.Add('=== 作业单变返工'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                6:   Memo1.Lines.Add('=== 数量分拆(尾数)于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                7:   Memo1.Lines.Add('=== 更改作业单于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                8:   Memo1.Lines.Add('===修改作业单数量于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                9:   Memo1.Lines.Add('=== 数量分拆(待返工)于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                10:  Memo1.Lines.Add('=== 数量分拆(待报废)于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                11:  Memo1.Lines.Add('=== 作业单申请返工于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                12:  Memo1.Lines.Add('=== 作业单申请报废于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                13:  Memo1.Lines.Add('=== MRB鉴定返工确认于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                14:  Memo1.Lines.Add('=== MRB鉴定报废确认于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                15:  Memo1.Lines.Add('=== MRB鉴定退回于'+fieldbyname('tdate').asstring+'   经由:'+fieldbyname('employee_name').asstring+' ===');
                end;
                if trim(fieldbyname('remark').asstring)<>'' then
                  Memo1.Lines.Add(fieldbyname('remark').asstring);
                next;
             end;
           finally
             AdoqryTmp.Close;
             AdoqryTmp.Free;
           end;
         end;

    1:sqlstr:='SELECT dbo.Data0039.REJECT_DESCRIPTION, dbo.Data0034.DEPT_NAME, d34.DEPT_NAME AS resp_dept_name, '+
             'dbo.Data0058.QTY_REJECT, dbo.Data0058.PANELS, dbo.Data0058.TDATETIME, dbo.Data0039.REJ_CODE,data0005.EMPLOYEE_NAME '+
             'FROM dbo.Data0058 INNER JOIN '+
              'dbo.Data0034 AS d34 ON dbo.Data0058.RESP_DEPT_PTR = d34.RKEY INNER JOIN '+
              'dbo.Data0039 ON dbo.Data0039.RKEY = dbo.Data0058.REJECT_PTR INNER JOIN '+
              'dbo.Data0034 ON dbo.Data0058.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN '+
              'data0005 on data0058.EMPL_PTR=data0005.rkey '+
            'WHERE (dbo.Data0058.TTYPE <> 2) AND '+
            '(dbo.Data0058.WO_PTR ='+IntToStr(WO_Rkey)+') '+
            'ORDER BY dbo.Data0058.TDATETIME';

    2: sqlstr:=' SELECT Data0006.WORK_ORDER_NUMBER,Data0048.INTIME,Data0048.OUTTIME,data0034.dept_name as dptname,'+
            ' Data0048.QTY_PROD,Data0048.QTY_REJECT,Data0048.panels,data0005.employee_name,data0048.step_no,data0048.ACTION_REF, '+
            ' (case when data0048.wtype=0 then ''正常'' when data0048.wtype=2 then ''返工'' when data0048.wtype=3 then ''外发'' end) wtype '+
            ' FROM Data0006 inner join Data0048 on Data0048.WO_PTR=Data0006.RKEY left outer join data0005 on data0048.empl_ptr=data0005.rkey '+
            ' left outer join Data0034 ON Data0048.FM_dept_PTR=Data0034.RKEY WHERE data0048.wo_ptr= '+IntToStr(WO_Rkey)+' ORDER BY DATA0048.STEP_NO,DATA0048.INTIME';

   { 1 : sqlstr:=' select data0039.reject_description,data0034.dept_name,'+
                ' a.dept_name as resp_dept_name,data0058.qty_reject,data0058.panels,tdatetime '+
                ' from data0039,data0034,data0058 left outer join data0034 a '+
                ' on data0058.resp_dept_ptr=a.rkey where data0058.reject_ptr=data0039.rkey '+
                ' and data0058.dept_ptr=data0034.rkey and data0058.ttype<>2 and data0058.wo_ptr='+IntToStr(WO_Rkey);

    2 : sqlstr:=' SELECT Data0006.WORK_ORDER_NUMBER,Data0048.INTIME,Data0048.OUTTIME,data0034.dept_name as dptname,'+
                ' Data0048.QTY_PROD,Data0048.QTY_REJECT,Data0048.panels,data0005.employee_name '+
                ' FROM Data0006 inner join Data0048 on Data0048.WO_PTR=Data0006.RKEY left outer join data0005 on data0048.empl_ptr=data0005.rkey '+
                ' left outer join Data0034 ON Data0048.FM_dept_PTR=Data0034.RKEY WHERE data0048.wo_ptr= '+IntToStr(WO_Rkey)+' ORDER BY DATA0048.STEP_NO,DATA0048.INTIME';
    }
    3 : sqlstr:=' select data0038.rkey,data0038.def_ROUT_inst,step_number,data0038.def_rout_inst,data0034.dept_code, '+
                ' data0034.dept_name,data0034.barcode_entry_flag from data0038,data0034 '+
                ' where data0038.source_ptr='+IntToStr(prod_rkey)+' and data0038.dept_ptr=data0034.rkey order by data0038.step_number ';
    4 : sqlstr:=' SELECT  D06.WORK_ORDER_NUMBER,D53.quantity, D53.mfg_date,D15.Warehouse_name '+
                ' FROM Data0006 D06 , data0053 D53,Data0015 D15 WHERE D53.WORK_ORDER_PTR=D06.RKEY and D15.rKey=D53.WHSE_Ptr '+
                ' AND D06.RKEY='+IntToStr(WO_Rkey)+' ORDER BY D53.MFG_DATE ';

    5 : sqlstr := 'select file_name,in_date,remark,rkey from Data0564 where source_ptr = ' + Dmcon.adsWOCtrlList.fieldbyname('rkey25').AsString + ' order by rec_no';

  end;
  if sqlstr<>'' then
  begin
    dmcon.adsWO_INFO.Close;
    dmcon.adsWO_INFO.CommandText := sqlstr;
    dmcon.adsWO_INFO.Open;
  end;
end;

procedure TfrmWO_INFO.MenuItem1Click(Sender: TObject);
begin
  with TFrmRoutParam.Create(Application) do
  try
    InitForm(dmcon.adsWO_INFO.fieldByName('rkey').Value,dmcon.adsWO_INFO.fieldByName('def_ROUT_inst').value);
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmWO_INFO.Enter(v_Wo_Rkey, v_Prod_rKey: integer);
begin
  WO_Rkey:=v_WO_Rkey;
  prod_rkey:=v_prod_rkey;
  PageControl1.ActivePageIndex := 0;
  PageControl1Change(nil);
  ShowModal;
end;

procedure TfrmWO_INFO.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWO_INFO.pm1Popup(Sender: TObject);
begin
  nN1.Enabled := not Dmcon.adsWO_INFO.IsEmpty;
end;

procedure TfrmWO_INFO.nN1Click(Sender: TObject);
var f:string;
    fs:TMemoryStream;
    LS: TStringList;
begin
  LS := TStringList.Create;
  fs := TMemoryStream.Create;
  try
    LS.Add('select vcut_bmp from data0564 where rkey = ' + Dmcon.adsWO_INFO.fieldbyname('rkey').AsString);
    if Dmcon.SQLOpen(Dmcon.tmp,LS) then
    begin
      if Dmcon.tmp.IsEmpty  then
      begin
        ShowMessage('无此文档');
        Exit;
      end;
      if Dmcon.tmp.FieldByName('vcut_bmp').IsNull then
      begin
        showmessage('此文档为空...');
        exit;
      end;
      TBlobField(Dmcon.tmp.FieldByName('vcut_bmp')).SaveToStream(fs);
      UnPackStream(fs);
      if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
      f:=TmpFileDir+dmcon.adsWO_INFO.fieldbyname('file_name').AsString;
      fs.SaveToFile(f);
      fs.Free;
      ShellExecute(0,'open',pchar(f),nil,nil,SW_SHOWNORMAL);
    end;
  finally
    LS.Free;
  end;



// setfileattributes(pchar(f),FILE_ATTRIBUTE_READONLY);

end;

procedure TfrmWO_INFO.eh1DblClick(Sender: TObject);
begin
  if not Dmcon.adsWO_INFO.IsEmpty then
    nN1Click(nN1);
end;

end.
