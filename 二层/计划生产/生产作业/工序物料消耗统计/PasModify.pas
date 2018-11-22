unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,Math,common,ComCtrls,StrUtils, Grids, DBGridEh,
  Menus,MyClass;

type
  TfrmModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnLoad: TBitBtn;
    btnCalcutlate: TBitBtn;
    Label1: TLabel;
    edtNO: TEdit;
    Label2: TLabel;
    edtDepart: TEdit;
    Label4: TLabel;
    edtExpress: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtSum: TEdit;
    Memo1: TMemo;
    DB571: TDBGridEh;
    btnExport: TBitBtn;
    Label3: TLabel;
    cbbWorkHour: TComboBox;
    Label8: TLabel;
    btnExpress: TBitBtn;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtRec: TEdit;
    dtpkStartDate: TDateTimePicker;
    dtpkSTime: TDateTimePicker;
    dtpkETime: TDateTimePicker;
    dtpkEndDate: TDateTimePicker;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnCalcutlateClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExpressClick(Sender: TObject);
    procedure edtExpressExit(Sender: TObject);
    procedure DB571KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DB571TitleClick(Column: TColumnEh);
    procedure dtpkStartDateChange(Sender: TObject);
    procedure btnCancelEnter(Sender: TObject);
  private
    ReColumn:TColumnEh;
    tmpsql:string;
    paraList:TStringList;
    function getPrice(key,row,col:string):string;
    function CheckOldData(MANU_NUMBER,FORMULA:string;dept571:Integer):Boolean;
    function GetPValue(rkey25,para,DEPT:string):string;
    function RePlaceBD(StrExp:string):string;
    function ReplaceIF(StrExp:string):string;
    function GetIFValue(strIF,V1,V2:string):string;
    procedure Insert571(key:string);
    procedure AddCoulum(rkey569:string);
    function CheckNull():Boolean;
    { Private declarations }
  public
    status,rkey570:Integer;

    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses DAMO,Pick_Item_Single,ConstVar,DateUtils,ADODB,DB;

{$R *.dfm}

procedure TfrmModify.FormShow(Sender: TObject);
var
  temp:TDateTime;
  i:Integer;
begin
  ReColumn:=DB571.Columns[0];
  temp:= getsystem_date(DM.adoTime,1);
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,abbr_name from data0015';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        cbbWorkHour.Items.AddObject(FieldByName('abbr_name').AsString,Pointer(FieldByName('rkey').AsInteger));
        Next;
      end;
    end;
  end;
  if vprev='2' then
  begin
    for i:=12 to 21 do
      DB571.Columns[i].ReadOnly:=True;
    DB571.Columns[24].ReadOnly:=true;
  end;
  if status=1 then
  begin
//    edtStartDate.Text:= '2014-05-30 08:00:00';
//    edtEndDate.Text:= '2014-06-05 08:00:00';
//    edtStartDate.Text:= FormatDateTime('yyyy-MM-dd', IncDay(temp,-1))+ ' 08:00:00';
//    edtEndDate.Text:= FormatDateTime('yyyy-MM-dd', temp)+ ' 08:00:00';
    dtpkStartDate.Date:= IncDay(temp,-1);
    dtpkEndDate.Date:=temp;
    frmModify.Caption := '新增';

    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,seed_value from data0004 where table_name=''data0570''';
      Open;
      if not IsEmpty then
      begin
        edtNO.Text:= FieldByName('seed_value').AsString;
      end;
    end;

    with DM.ado571 do
    begin
      Close;
      Parameters.ParamByName('rkey570').Value:=0;
      Open;
    end;
    DM.cds571.Open;
  end;

  if (status=2) or (status=3) then
  begin
    frmModify.Caption := '编辑';
//    Panel3.Enabled:=False;
    cbbWorkHour.Enabled:=False;
    btnExpress.Enabled:=False;
    edtExpress.Enabled:=False;
    btnLoad.Enabled:=False;
    dtpkStartDate.Enabled:=False;
    dtpkSTime.Enabled:=False;
    dtpkEndDate.Enabled:=False;
    dtpkETime.Enabled:=False;

    with DM.adoTime do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select data0570.rkey,number,data0570.DEPT_PTR,data0034.dept_code, data0570.formula_number,' + #13+
                   ' data0569.theorycalc_meth, start_date, end_date, '+
                   ' theory_result, master_remark, warehouse_ptr,data0015.abbr_name,expend_QUANTITY '+ #13+
                   ' from data0570 inner join data0034 on data0570.dept_ptr=data0034.rkey '+ #13 +
                   ' inner join data0015 on data0570.warehouse_ptr=data0015.rkey '+ #13+
                   ' inner join data0569 on data0570.formula_number= data0569.formula_number '+ #13+
                   ' where data0570.rkey=' + IntToStr(rkey570);
      Open;
      if not IsEmpty then
      begin
        edtNO.Text:= FieldByName('number').AsString;
        dtpkStartDate.Date:=StrToDate(FormatDateTime('YYYY-MM-DD',FieldByName('start_date').Value));
        dtpkSTime.Time:=StrToTime(FormatDateTime('HH:MM:SS',FieldByName('start_date').Value));
        dtpkEndDate.Date:=StrToDate(FormatDateTime('YYYY-MM-DD',FieldByName('end_date').value));
        dtpkETime.Time:= StrToTime(FormatDateTime('HH:MM:SS',FieldByName('end_date').value));
        edtSum.Text:=FieldByName('theory_result').AsString;
        edtDepart.Text:=FieldByName('dept_code').AsString;
        edtDepart.Tag:=FieldByName('DEPT_PTR').AsInteger;
        edtExpress.Text:=FieldByName('formula_number').AsString;
        edtExpress.Hint:=FieldByName('theorycalc_meth').AsString;
        Memo1.Lines.Text:=FieldByName('master_remark').AsString;
        edtRec.Text:=FieldByName('expend_QUANTITY').AsString;
        AddCoulum(FieldByName('formula_number').AsString);
        for i:=0 to cbbWorkHour.Items.Count-1 do
        begin
          if FieldByName('abbr_name').AsString=cbbWorkHour.Items[i] then
          begin
            cbbWorkHour.ItemIndex:=i;
            Break;
          end;
        end;
      end;
    end;

    with DM.ado571 do
    begin
      Close;
      Parameters.ParamByName('rkey570').Value:=rkey570;
      Open;
    end;
    DM.cds571.Close;
    DM.cds571.Open;

    if status=3 then
    begin
      frmModify.Caption := '检查';
      btnSave.Enabled:=False;
      btnLoad.Enabled:=False;
      btnCalcutlate.Enabled:=False;
      DB571.ReadOnly:=True;
    end;
  end;
  Label10.Caption:=IntToStr(DM.cds571.RecordCount);
end;

procedure TfrmModify.btnExportClick(Sender: TObject);
begin
  if  not DM.cds571.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(DB571,'消耗明细');
end;

procedure TfrmModify.btnCalcutlateClick(Sender: TObject);
var
  strExpress,depstr:string;
  i:Integer;
  Bool,ibool:Boolean;
  theory_result,SDate,EDate:string;
begin
  Bool:=False;
  if DM.cds571.RecordCount=0 then Exit;
  if Trim(edtExpress.Hint)='' then
  begin
    ShowMessage('公式表达式为空，请先选择公式');
    edtExpress.SetFocus;
    Exit;
  end;
  depstr:='';
  Screen.Cursor:=crHourGlass;
  SDate:= DateToStr(dtpkStartDate.Date)+ ' ' +  TimeToStr(dtpkSTime.Time);
  EDate:= DateToStr(dtpkEndDate.Date)+ ' ' +  TimeToStr(dtpkETime.Time);

  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= ' SELECT RKEY FROM DATA0034 WHERE  COST_DEPT_PTR = ' + IntToStr(edtDepart.Tag) +
              ' union '+
              'SELECT DATA0154.dept_ptr from data0154 INNER JOIN  '+#13+
              '                                DATA0136 ON DATA0136.rkey = DATA0154.control_ptr  '+#13+
              '                                WHERE data0136.IsFormula=1 and DBO.DATA0136.FORMULA_PTR = ' + QuotedStr(Trim(edtExpress.Text)) + #13+
              '                                    and DBO.DATA0136.warehouse_ptr = ' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) ;
     Open;
     if not IsEmpty then
     begin
       while not Eof do
       begin
         depstr := FieldByName('rkey').AsString + ',' + depstr;
         Next;
       end;
       depstr:= Copy(depstr,1,Length(depstr)-1);
     end;
  end;
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    sql.Text:='SELECT    ISNULL(SUM(dbo.Data0207.QUANTITY),0) AS TOTAL  '+#13+
              '  FROM         dbo.Data0207 INNER JOIN   '+#13+
              '                        dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY INNER JOIN   '+#13+
              '                        dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.RKEY  '+#13+
              '  WHERE DBO.DATA0207.TDATE BETWEEN ' + QuotedStr(SDate) +
              '      AND ' + QuotedStr(EDate) +#13+
              '      AND DBO.DATA0457.warehouse_ptr = ' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) +#13+
              '      AND dbo.data0207.DEPT_PTR IN ( ' + depstr + ')'+ #13+
              '      AND dbo.data0207.inventory_ptr in (  '+#13+
              '          SELECT DBO.data0155.invt_ptr FROM DBO.data0155 INNER JOIN  '+#13+
              '              DBO.DATA0136 ON DBO.DATA0155.CONTROL_PTR = DBO.DATA0136.RKEY   '+#13+
              '          WHERE data0136.IsFormula=1 and DBO.DATA0136.FORMULA_PTR = ' + QuotedStr(Trim(edtExpress.Text)) + #13+
              '          and DBO.DATA0136.warehouse_ptr = ' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) + ')';
//    ShowMessage(sql.Text);
    Open;
    edtRec.Text:= FieldByName('TOTAL').AsString;
  end;


  DM.cds571.First;
  DM.cds571.DisableControls;
  try
    while not DM.cds571.Eof do
    begin
      strExpress:=edtExpress.Hint;
      strExpress:=StringReplace(strExpress,#13#10,'',[rfReplaceAll]);    //去回车换行;
      strExpress:=StringReplace(strExpress,' ','',[rfReplaceAll]);   //去空格

      strExpress:= StringReplace(strExpress,'PANEL_A_B ',DM.cds571.FieldByName('PANEL_A_B').AsString,[rfReplaceAll,rfIgnoreCase]);
      strExpress:= StringReplace(strExpress,'PAN_QTY',DM.cds571.FieldByName('PAN_QTY').AsString,[rfReplaceAll,rfIgnoreCase]);
  //        strExpress:= StringReplace(strExpress,'SET_QTY',DM.cds571.FieldByName('SET_QTY').AsString,[rfReplaceAll,rfIgnoreCase]);
      strExpress:= StringReplace(strExpress,'PCS_QTY',DM.cds571.FieldByName('PCS_QTY').AsString,[rfReplaceAll,rfIgnoreCase]);
      strExpress:= StringReplace(strExpress,'PAN_SQRT',DM.cds571.FieldByName('PAN_SQRT').AsString,[rfReplaceAll,rfIgnoreCase]);
  //        strExpress:= StringReplace(strExpress,'SET_SQRT',DM.cds571.FieldByName('SET_SQRT').AsString,[rfReplaceAll,rfIgnoreCase]);
      strExpress:= StringReplace(strExpress,'PCS_SQRT',DM.cds571.FieldByName('PCS_SQRT').AsString,[rfReplaceAll,rfIgnoreCase]);

      ibool:=true;
      while(ibool) do          //有BUG，当类似参数A 参数A-1这种类型的参数重复出现时，会出错。
      begin
        ibool:=False;
        for i:=0 to paraList.Count-1 do        //替换参数
            strExpress:=StringReplace(strExpress,paraList.Names[i],DM.cds571.FieldByName('PARA_VALUE_' + IntToStr(i)).asstring ,[rfIgnoreCase]);
  //            strExpress:=StringReplace(strExpress,paraList.Names[i],
  //                IfThen(DM.cds571.FieldByName('PARA_VALUE_' + IntToStr(i)).isnull,'0',DM.cds571.FieldByName('PARA_VALUE_' + IntToStr(i)).asstring),[rfIgnoreCase]);
        for i:=0 to paraList.Count-1 do
          if Pos(paraList.Names[i],strExpress)>0 then
          begin
            ibool:=true;
            break;
          end;
      end;

//        ShowMessage(strExpress);

      strExpress:=RePlaceBD(strExpress);     //替换工程表单
      strExpress:=ReplaceIF(strExpress);     //替换IF

      try
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select 1.0*'+ strExpress +' as theory_result';
//          ShowMessage(SQL.Text);
          Open;

          theory_result:=FieldByName('theory_result').AsString;
          DM.cds571.Edit;
          DM.cds571theory_result.AsString:= theory_result;
          DM.cds571.Post;
        end;
      except
        Bool:=True;           //之所以会出错，是因为可能取的以前保存的空值。
  //        ShowMessage(strExpress);
      end;
      DM.cds571.Next;
    end;
  finally
    DM.cds571.EnableControls;
  end;
  Screen.Cursor:=crDefault;
  if Bool then
    ShowMessage('部分数据无法计算结果，请检查理论值为0的参数中是否存在空值或非数字型值！');
//  edtRec.ReadOnly:= False;
end;


function TfrmModify.getPrice(key, row, col: string): string;
var
  irow,icol,iPrice:string;
begin
  iPrice:='1';
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select top 1 Tvalue,col from data0282 where eng_table_ptr= '+ key +
              ' and row_index=1 and cast(tvalue as decimal(20,8))>= '+ QuotedStr(col);
    Open;
    if not IsEmpty then icol:=FieldByName('col').AsString
    else
    begin
      Result:='0';
      Exit;
    end;

  end;
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select  top 1 Tvalue,row_index from data0282 where eng_table_ptr= '+ key +
              ' and col=1 and cast(tvalue as decimal(20,8))>= '+ QuotedStr(row);
    Open;
    if not IsEmpty then irow:=FieldByName('row_index').AsString
    else
    begin
      Result:='0';
      Exit;
    end;
  end;
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select top 1 Tvalue from data0282 where eng_table_ptr= '+ key +
              ' and row_index='+ irow+ ' and col='+ icol;
//    ShowMessage(SQL.Text);
    Open;
    if not IsEmpty then iPrice:=FieldByName('Tvalue').AsString
    else
    begin
      Result:='0';
      Exit;
    end;
  end;
  Result:=iPrice;
end;

function TfrmModify.CheckOldData(MANU_NUMBER,FORMULA: string;dept571:Integer):Boolean;
var
  i:Integer;
  tmp:TADOQuery;
begin
  Result:=False;
  tmp:=TADOQuery.Create(nil);
  tmp.Connection:=DM.ADOConnection1;
  with tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select top 1 PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, '+ #13+
		          '	PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9,PARA_VALUE_0 '+ #13+
              ' ,PARA_VALUE_1,PARA_VALUE_2,PARA_VALUE_3,PARA_VALUE_4,PARA_VALUE_5 '+  #13+
              ' ,PARA_VALUE_6,PARA_VALUE_7,PARA_VALUE_8,PARA_VALUE_9 '+  #13+
              ' from data0571 inner join '+ #13+
              '  data0570 on data0571.Statistic_ptr=data0570.rkey '+ #13+
              ' where data0571.MANU_PART_NUMBER='+ QuotedStr(MANU_NUMBER) +#13+
              ' and DATA0570.FORMULA_NUMBER ='+ QuotedStr(FORMULA) +#13+
              ' and data0571.dept_ptr ='+ inttostr(dept571) +#13+
              ' order by data0571.Statistic_ptr DESC';
//    ShowMessage(SQL.Text);
    Open;
    if not IsEmpty then
    begin
      DM.cds571.Edit;
      for i:=0 to 9 do
      begin
        if not Fields[i].IsNull then
        begin
          DM.cds571.FieldByName('PARA_PTR_'+ IntToStr(i)).Value:=Fields[i].Value;
          DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).Value:= Fields[10+i].Value;
        end;
      end;
      dm.cds571if_read571.Value:='Y';
      DM.cds571.Post;
      Result:=True;
    end
    else
    begin
      DM.cds571.Edit;
      dm.cds571if_read571.Value:='N';
      DM.cds571.Post;
    end;
  end;
end;

procedure TfrmModify.btnLoadClick(Sender: TObject);
var
  rec_no,i:Integer;
  custRkey,rkeys34:string;
  StartD,EndD:string;
begin

  if DM.cds571.RecordCount<>0 then
  begin
    if MessageDlg('重新读取会清除现有读取的数据，是否继续？',mtWarning,[mbYes,mbNo],0)=mrno then Exit
    else
    begin
      DM.cds571.EmptyDataSet;
      DB571.SumList.Active:=false;
      edtSum.Text:='0';
      edtRec.Text:='0';
    end;
  end;
  StartD:= FormatDateTime('YYYY-MM-DD',dtpkStartDate.Date)+ ' ' +  FormatDateTime('HH:MM:SS',dtpkSTime.Time);
  EndD:= FormatDateTime('YYYY-MM-DD',dtpkEndDate.Date)+ ' ' +  FormatDateTime('HH:MM:SS',dtpkETime.Time);
  if Trim(edtDepart.Text)='' then
  begin
    ShowMessage('请先选择工序');
    edtDepart.SetFocus;
    Exit;
  end;
  if cbbWorkHour.Text='' then
  begin
    ShowMessage('请选择工厂');
    cbbWorkHour.SetFocus;
    Exit;
  end;
  if Trim(edtExpress.Text)='' then
  begin
    ShowMessage('请选择公式编码');
    edtExpress.SetFocus;
    Exit;
  end;
  if StrToDateTime(StartD)>= StrToDateTime(EndD) then
  begin
    ShowMessage('开始时间不能大于结束时间');
    exit;
  end;

  rec_no:=1;
  rkeys34:='0';
  try
    DM.cds571.DisableControls;
    Screen.Cursor:=crHourGlass;
    with DM.adoTmp do
    begin
      Close;
      sql.Clear;
      SQL.Text:='SELECT DATA0154.DEPT_PTR    '+#13+
                '  FROM data0569 inner join    '+#13+
                '      data0136 on data0136.FORMULA_PTR=DATA0569.FORMULA_NUMBER INNER JOIN   '+#13+
                '      DATA0154 ON data0136.RKEY=DATA0154.CONTROL_PTR   '+#13+
                '  WHERE data0136.IsFormula=1 and data0569.FORMULA_NUMBER= ' + QuotedStr(Trim(edtExpress.Text)) +
                '  AND data0136.warehouse_ptr = ' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex]));
      Open;
      if not IsEmpty then
      begin
        First;
        while not Eof do
        begin
          rkeys34:= Fields[0].AsString + ',' + rkeys34;
          Next;
        end;
//        rkeys34:= Copy(rkeys34,0,Length(rkeys34)-1);
      end;
    end;
//    ShowMessage(rkeys34);
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT     TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,dbo.Data0048.FM_DEPT_PTR, dbo.Data0025.LAYERS,  '+
                '        dbo.Data0025.ttype,dbo.Data0010.CUST_CODE, dbo.Data0006.pnl_size, dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 AS pan_sqrt, '+
                '        dbo.Data0025.ANALYSIS_CODE_5, dbo.Data0025.unit_sq, CASE dbo.Data0006.PANEL_A_B WHEN 0 THEN ''APNL'' ELSE ''BPNL'' END AS panel_ab,  '+
                '        SUM(dbo.Data0048.PANELS) AS pan_total, SUM(dbo.Data0048.QTY_PROD) AS pcs_total, '+
                '       SUM(dbo.Data0048.PANELS * dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001) as total_sqrt '+ #13+
                '  FROM         dbo.Data0048 INNER JOIN '+  #13+
                '        dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNER JOIN  '+  #13+
                '        dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN   '+   #13+
                '        dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN   '+   #13+
                '       dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY    '+  #13+
                '  WHERE     (dbo.Data0048.OUTTIME > '+ QuotedStr(StartD) +') AND (dbo.Data0048.OUTTIME <= '+ QuotedStr(EndD) +
                '        ) AND (dbo.Data0048.warehouse_ptr = '+ IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) +') AND (dbo.Data0048.FM_DEPT_PTR in ('+
                         rkeys34 +')) and dbo.data0048.wtype<>3'+#13+
                '  GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, dbo.Data0006.panel_ln,   '+
                 '       dbo.Data0006.panel_wd, dbo.Data0006.pnl_size, dbo.Data0025.LAYERS, dbo.Data0025.ttype, dbo.Data0006.PANEL_A_B, dbo.Data0025.unit_sq,  '+
                 '       dbo.Data0025.ANALYSIS_CODE_5,dbo.Data0048.FM_DEPT_PTR '+
                 ' order BY dbo.Data0025.MANU_PART_NUMBER';
//      ShowMessage(SQL.text);
      Open;
      if not IsEmpty then
      begin                                                              //把48 ，06表中的数据插入
        First;
        while not Eof do
        begin
          DM.cds571.Append;
          DM.cds571Statistic_ptr.AsInteger:=0;
          DM.cds571recno_number.AsInteger:= rec_no;
          dm.cds571ttype.AsInteger:=FieldByName('ttype').AsInteger;
          DM.cds571MANU_PART_NUMBER.AsString:=FieldByName('MANU_PART_NUMBER').AsString;
          DM.cds571MANU_PART_DESC.AsString:=FieldByName('MANU_PART_DESC').AsString;
          DM.cds571DEPT_PTR.AsInteger:= FieldByName('FM_DEPT_PTR').AsInteger;
          DM.cds571customer_name.AsString:=FieldByName('CUST_CODE').AsString;
          DM.cds571pan_qty.AsInteger:=FieldByName('pan_total').AsInteger;
          DM.cds571PANEL_A_B.AsString:=FieldByName('panel_ab').AsString;
          dm.cds571pcs_qty.AsInteger:=FieldByName('pcs_total').AsInteger;
          DM.cds571pan_size.AsString:=FieldByName('pnl_size').AsString;
          DM.cds571pcs_size.AsString:=FieldByName('ANALYSIS_CODE_5').AsString;
          dm.cds571pan_sqrt.AsCurrency:=FieldByName('pan_sqrt').AsCurrency;
          DM.cds571pcs_sqrt.AsCurrency:=FieldByName('unit_sq').AsCurrency;
          DM.cds571layers.AsInteger:=FieldByName('LAYERS').AsInteger;
          DM.cds571total_sqrt.AsCurrency:= FieldByName('total_sqrt').AsCurrency;
          DM.cds571.Post;
          rec_no:=rec_no+1;

          Next;
        end;
      end
      else
      begin
        ShowMessage('没有工序过数记录或没有定义消耗标准！');
        Screen.Cursor:=crDefault;
        Exit;
      end;
    end;

    with DM.adoTmp do                                       //更新参数RKEY
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT  PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, ' +
                '      PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9  ' + #13+
                ' FROM DBO.DATA0569 ' + #13+
                ' WHERE FORMULA_NUMBER= '+ QuotedStr(Trim(edtExpress.Text));
      Open;
      DM.cds571.First;
      DM.cds571.DisableControls;
      try
        if not IsEmpty then
        begin
          while not DM.cds571.Eof do
          begin
            tmpsql:='select rkey from data0025 where manu_part_number='+ QuotedStr(DM.cds571MANU_PART_NUMBER.AsString);
            custRkey:=MyDataClass.Get_Sql_Value(tmpsql);

            CheckOldData(DM.cds571.FieldByName('MANU_PART_NUMBER').AsString,Trim(edtExpress.Text),DM.cds571DEPT_PTR.AsInteger);//查找旧数据
            dm.cds571.Edit;
            for i:=0 to paraList.Count-1 do
            begin
              if DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).IsNull or (DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).AsString = '0') then
              begin
                DM.cds571.FieldByName('PARA_PTR_'+ IntToStr(i)).Value:=DM.adoTmp.Fields[i].Value;
                DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).AsString:= GetPValue(custRkey,DM.adoTmp.Fields[i].AsString,DM.cds571DEPT_PTR.AsString);
                
              end;
            end;
            DM.cds571.Post;
            DM.cds571.Next;
          end;
        end;
      finally
        DM.cds571.EnableControls;
      end;
    end;
    DM.cds571.EnableControls;
    Screen.Cursor:=crDefault;
    Label10.Caption:=IntToStr(DM.cds571.RecordCount);
    DB571.SumList.Active:=True;
//    edtRec.ReadOnly:=True;
//    ShowMessage(DB571.GetFooterValue(0,DB571.Columns[10]));
  except
    on E: Exception do
    begin
      Screen.Cursor:=crDefault;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmModify.btnSaveClick(Sender: TObject);
var
  key570,strSQL: string;
  rkey04:Integer;
  SD,ED:string;  //时间
  i:Integer;
begin
  if DM.cds571.State in [dsEdit,dsInsert] then DM.cds571.Post;
  if not CheckNull then
  begin
    ShowMessage('必填参数中存在0或空值，不能保存，联系工程部修正后重试！！！');
    Exit;
  end;
  rkey04:=0;
  try
    if DM.cds571.RecordCount>0 then
    begin
      SD:= DateToStr(dtpkStartDate.Date)+ ' ' +  TimeToStr(dtpkSTime.Time);
      ED:= DateToStr(dtpkEndDate.Date)+ ' ' +  TimeToStr(dtpkETime.Time);
      if status=1 then
      begin
        strSQL:=' SELECT 1 FROM DATA0570 WHERE formula_number= ' + QuotedStr(trim(edtExpress.Text)) + ' AND START_DATE= '
                + QuotedStr(SD) + ' AND warehouse_ptr = ' +  IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex]));
        IF MyDataClass.Get_Sql_Value(strSQL)=1 then
        begin
          ShowMessage('此工序已经存在当前日期的统计记录！');
          exit;
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey,seed_value,seed_flag from data0004 where table_name=''data0570''';
          Open;
          if (FieldByName('seed_value').AsString<>edtNO.Text) and (FieldByName('seed_value').AsInteger<>1) then
            edtNO.Text:= FieldByName('seed_value').AsString
          else
            rkey04:= FieldByName('rkey').AsInteger;
        end;
        if Trim(edtSum.Text)='' then edtSum.Text:='0';
        DM.ADOConnection1.BeginTrans;
        
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='insert into data0570(number, ttype, status, DEPT_PTR, formula_number, start_date, end_date, EMPL_PTR,'+
                     ' Statistic_date, theory_result, master_remark, warehouse_ptr,expend_QUANTITY,pnl_totalsqrt)' + #13 +
                     ' values(' + QuotedStr(Trim(edtNO.Text)) + ',0,0,' + IntToStr(edtDepart.Tag) + ',' + QuotedStr(Trim(edtExpress.Text))+
                     ',' + QuotedStr(SD) + ',' + QuotedStr(ED) + ',' + user_ptr +
                     ',' + QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1))) + ',' + Trim(edtSum.Text) + ',' +
                     QuotedStr(Memo1.Lines.Text) + ',' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) + ',' +
                     Trim(edtRec.Text) + ',' + DB571.GetFooterValue(0,DB571.Columns[10]) + ')';
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        Update_Seed(rkey04);

        strSQL:= 'select rkey from data0570 where number=' + QuotedStr(Trim(edtNO.Text));
        key570:= MyDataClass.Get_Sql_Value(strSQL);

        DM.cds571.DisableControls;
        Self.Insert571(key570);
        DM.cds571.EnableControls;
        DM.ADOConnection1.CommitTrans;
        rkey570:=StrToInt(key570);
        ModalResult:=mrYes;
      end;

      if status=2 then
      begin
        DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='delete from data0571 where statistic_ptr=' + IntToStr(rkey570);
          ExecSQL;
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0570 set DEPT_PTR= '+ IntToStr(edtDepart.Tag)+', formula_number='+ QuotedStr(Trim(edtExpress.Text))+
                  ', start_date='+ QuotedStr(SD)+', end_date='+ QuotedStr(ED)+
                  ', EMPL_PTR='+ user_ptr+',Statistic_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1)))+
                  ', theory_result='+Trim(edtSum.Text)+', master_remark='+ QuotedStr(Memo1.Lines.Text)+
                  ',expend_QUANTITY=' + Trim(edtRec.Text)+ ',pnl_totalsqrt='+ DB571.GetFooterValue(0,DB571.Columns[10])+
                  ', warehouse_ptr='+ IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex]))+ #13+
                  ' where rkey='+ IntToStr(rkey570);
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        DM.cds571.DisableControls;
        Self.Insert571(IntToStr(rkey570));
        DM.cds571.EnableControls;
        DM.ADOConnection1.CommitTrans;
        ModalResult:=mrYes;
      end;
    end
    else
    begin
      ShowMessage('当前统计的记录为空，请先读取统计记录');
      Exit;
    end;
  except
    on E: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmModify.btnExpressClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'formula_number/公式代码/180,dept_name/工序名称/250';
    InputVar.Sqlstr := 'select data0569.formula_number,data0569.theorycalc_meth,data0034.rkey,data0034.dept_code,data0034.dept_name '+
                      ' from data0569 inner join data0034 on data0569.dept_ptr=data0034.rkey '+
                      ' where  data0569.ttype=0';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtExpress.Text:= frmPick_Item_Single.adsPick.fieldbyname('formula_number').AsString;
      edtExpress.Hint:= frmPick_Item_Single.adsPick.fieldbyname('theorycalc_meth').AsString;
      edtDepart.Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').AsString;
      edtDepart.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
      AddCoulum(frmPick_Item_Single.adsPick.fieldbyname('formula_number').AsString);
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.edtExpressExit(Sender: TObject);
begin
  if Trim(edtExpress.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select data0569.formula_number,data0569.theorycalc_meth,data0034.rkey,data0034.dept_code,data0034.dept_name '+
                ' from data0569 inner join data0034 on data0569.dept_ptr=data0034.rkey '+
                ' where data0569.ttype=0 and data0569.formula_number='+ QuotedStr(Trim(edtExpress.Text));
      Open;
      if IsEmpty then
      begin
        ShowMessage('公式编号不存在，请重新输入');
        edtExpress.SetFocus;
        Exit;
      end
      else
      begin
        edtExpress.Hint:=FieldByName('theorycalc_meth').AsString;
        edtDepart.Text:=FieldByName('dept_code').AsString;
        edtDepart.Tag:= FieldByName('rkey').AsInteger;
      end;
    end;
  end
  else
  begin
    edtDepart.Text:='';
  end;
end;

procedure TfrmModify.DB571KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.cds571.RecNo=dm.cds571.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TfrmModify.FormDestroy(Sender: TObject);
begin
  MyDataClass.Free;
  paraList.Free;
end;

procedure TfrmModify.FormCreate(Sender: TObject);
begin
  MyDataClass:=TMyDataClass.Create(DM.ADOConnection1);
  paraList:=TStringList.Create;
end;

function TfrmModify.GetPValue(rkey25, para,DEPT: string): string;
var
  tmp:TADOQuery;
  sqlstr:string;
begin
  try
    Result:='';
    tmp:=TADOQuery.Create(nil);
    tmp.Connection:=DM.ADOConnection1;
    sqlstr:= 'select d279.parameter_value' +#13+
               ' from dbo.data0279 d279 inner join dbo.data0278 d278 on d278.rkey=d279.parameter_ptr  '+#13+
               ' where d279.source_ptr= ' + rkey25 +' and d278.rkey =' + para;
//    ShowMessage(sqlstr);
    MyDataClass.OpenQuery(tmp,sqlstr);
    if not tmp.IsEmpty then
    begin
//      IF tmp.Fields[0].AsString='' then Result:='0'
//      ELSE
      Result:= tmp.Fields[0].AsString;
    end
    else
    begin
      sqlstr:= 'SELECT   dbo.Data0494.PARAMETER_VALUE '+ #13+
                    ' FROM dbo.Data0494 INNER JOIN  '+ #13+
                    '            dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.RKEY  INNER JOIN  '+ #13+
                    '           DBO.DATA0038 ON DBO.DATA0038.SOURCE_PTR=DBO.DATA0494.CUSTPART_PTR AND  '+ #13+
                    '            DBO.DATA0038.STEP_NUMBER=DBO.DATA0494.STEP_NUMBER  '+ #13+
                    ' WHERE dbo.Data0278.rkey='+ para +' AND dbo.Data0494.custpart_ptr = '+ rkey25 +
                    ' AND DBO.DATA0038.DEPT_PTR = ' + DEPT;
//    ShowMessage(sqlstr);
      MyDataClass.OpenQuery(tmp,sqlstr);
      if not tmp.IsEmpty then
      begin
        if trim(tmp.Fields[0].AsString)='' then Result:='0'
        else Result:= tmp.Fields[0].AsString;
      end
      else
      begin
        sqlstr:= 'SELECT   dbo.Data0494.PARAMETER_VALUE '+ #13+
                      ' FROM dbo.Data0494 INNER JOIN  '+ #13+
                      '            dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.RKEY  INNER JOIN  '+ #13+
                      '           DBO.DATA0038 ON DBO.DATA0038.SOURCE_PTR=DBO.DATA0494.CUSTPART_PTR AND  '+ #13+
                      '            DBO.DATA0038.STEP_NUMBER=DBO.DATA0494.STEP_NUMBER  '+ #13+
                      ' WHERE dbo.Data0278.rkey='+ para +' AND dbo.Data0494.custpart_ptr = '+ rkey25;
        MyDataClass.OpenQuery(tmp,sqlstr);
        if not tmp.IsEmpty then
        begin
          if trim(tmp.Fields[0].AsString)='' then Result:='0'
          else Result:= tmp.Fields[0].AsString;
        end
        else Result:= '0';
      end;
    end;
  finally
    tmp.Free;
  end;
end;

procedure TfrmModify.AddCoulum(rkey569:string);
var
  i:Integer;
  tmp:TADOQuery;
begin
  if DM.cds571.Active and (DM.cds571.RecordCount<>0) then
  begin
    if MessageDlg('更换公式会清除现有读取的数据，是否继续？',mtWarning,[mbYes,mbNo],0)=mrno then Exit
    else
    begin
      DM.cds571.EmptyDataSet;
      DB571.SumList.Active:=false;
      edtSum.Text:='0';
      edtRec.Text:='0';
    end;
  end;
  tmp:=TADOQuery.Create(nil);
  tmp.Connection:=DM.ADOConnection1;
  if paraList.Count<>0 then
  begin
    for i:=0 to  paraList.Count-1 do
    begin
      DB571.Columns[12+i].FieldName:='';
      DB571.Columns[12+i].Title.Caption:= '';
      DB571.Columns[12+i].Visible:=False;
    end;
  end;
  paraList.Clear;
  with dm.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT TOP 1  PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, '+
            ' PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9 '+ #13+
            ' FROM DBO.DATA0569 '+
            ' WHERE formula_number= ' + QuotedStr(rkey569) ;
    Open;
    for i:=0 to 9 do
      if not ((Fields[i].IsNull) or (Fields[i].Value = 0)) then
      begin
        DB571.Columns[12+i].Visible:=True;
        with Tmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT PARAMETER_NAME,PARAMETER_DESC,STATUS3 FROM DBO.DATA0278 '+ #13+
                    ' WHERE RKEY= ' + DM.adoTmp.Fields[i].AsString;
          Open;
          DB571.Columns[12+i].FieldName:=DM.cds571.Fields[31+i].FieldName;
          DB571.Columns[12+i].Title.Caption:= tmp.Fields[1].Value;
          DB571.Columns[12+i].Width:=80;
          paraList.Add(tmp.Fields[0].AsString + '=' + tmp.Fields[2].AsString);
        end;
      end;
  end;
end;

//function TfrmModify.GetPCount(rkey569: string): Integer;
//var
//  sqlstr:string;
//  i,PCount:Integer;
//begin
//  PCount:=0;
//  with dm.adoTmp do
//  begin
//     Close;
//    SQL.Clear;
//    SQL.Text:='SELECT TOP 1  PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PARA_PTR_3, PARA_PTR_4, '+
//            ' PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9 '+ #13+
//            ' FROM DBO.DATA0569 '+
//            ' WHERE formula_number= ' + QuotedStr(rkey569) ;
//    Open;
//    for i:=0 to 9 do
//      if not Fields[i].IsNull then PCount:=PCount+1;
//  end;
//  Result:=PCount;
//end;


function TfrmModify.RePlaceBD(StrExp: string): string;
var
  BDPos,SPos,MPos,EPos:Integer;
  paraValueLeft,paraValueRigth,MidExp:string;
begin
  with dm.adoTime do                 //替换工程表单
  begin
    Close;
    SQL.Clear;
    SQL.Text:=' SELECT TOP 100 PERCENT data0280.rkey,Data0280.ENG_TABLE_NAME,Data0280.DATA_TYPE '+
              ' FROM dbo.Data0280';
    Open;
    First;
    while not Eof do
    begin
      while Pos(dm.adoTime.Fields[1].AsString + '(' ,StrExp) > 0 do
      begin
        BDPos:= Pos(Fields[1].AsString + '(' ,StrExp);
        SPos:= Pos('(',Copy(StrExp,BDPos,Length(StrExp) - BDPos+1));
        MPos:= Pos(',',Copy(StrExp,SPos+BDPos,Length(StrExp) - (SPos + BDPos)+1));
        EPos:= Pos(')',Copy(StrExp,BDPos+ SPos+ MPos,Length(StrExp)-(BDPos+ SPos+ MPos)+1));
        paraValueLeft:= Copy(StrExp,BDPos+SPos,MPos-1);
        paraValueRigth:= Copy(StrExp,BDPos+SPos+MPos,EPos-1);
//        ShowMessage(paraValueLeft+ ' 9999 ' + paraValueRigth);
        MidExp:=getPrice(Fields[0].AsString,paraValueLeft,paraValueRigth);
        StrExp:=Copy(StrExp,0,BDPos-1) + MidExp + Copy(StrExp,BDPos+ SPos+ MPos+ EPos +1,10000);
      end;
      Next;
    end;
  end;
  Result:= StrExp;
end;

function TfrmModify.ReplaceIF(StrExp: string): string;
var
  BDPos,SPos,MPos,M2Pos,EPos:Integer;
  MidExp:string;
begin
  while Pos('IF',UpperCase(StrExp))>0 do               //替换IF
  begin
    BDPos:= Pos('IF(' ,StrExp);
    SPos:= Pos('(',Copy(StrExp,BDPos,Length(StrExp) - BDPos+1));
    MPos:= Pos(',',Copy(StrExp,SPos+BDPos,Length(StrExp) - (SPos + BDPos)+1));
    M2Pos:= Pos(',',Copy(StrExp,SPos+BDPos+MPos,Length(StrExp) - (SPos + BDPos + MPos)+1));
    EPos:= Pos(')',Copy(StrExp,SPos+BDPos+MPos+ M2Pos,Length(StrExp)-(BDPos + SPos+ MPos+ M2Pos)+1));
    MidExp:= GetIFValue(Copy(StrExp,BDPos+ SPos,MPos-1),Copy(StrExp,SPos+BDPos+MPos,M2Pos-1),Copy(StrExp,SPos+BDPos+MPos+ M2Pos,EPos-1));
    StrExp:= Copy(StrExp,0,BDPos-1) + MidExp + Copy(StrExp,SPos+ BDPos + MPos+ M2Pos+ EPos,10000);
  end;
  Result:=StrExp;
end;

function TfrmModify.GetIFValue(strIF, V1, V2:string): string;
begin
  IF MyDataClass.Get_Sql_Value('select case when (' + strIF + ' ) then 1 else 0 end as A') = 1  then Result:= V1
  else Result:=V2;
end;

procedure TfrmModify.Insert571(key:string);
begin
  DM.cds571.First;
  dm.adoTmp.Close;
  dm.adoTmp.SQL.Clear;

  while not DM.cds571.Eof do
  begin
    dm.adoTmp.SQL.Text:=Format('insert data0571(Statistic_ptr, recno_number, ttype, MANU_PART_NUMBER, MANU_PART_DESC,dept_ptr,PANEL_A_B, '+
             ' pan_qty, pcs_qty, pan_size,pcs_size, pan_sqrt, pcs_sqrt, LAYERS, theory_result, PARA_PTR_0, PARA_PTR_1, PARA_PTR_2,'+
             '  PARA_PTR_3, PARA_PTR_4,PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9,PARA_VALUE_0, PARA_VALUE_1,PARA_VALUE_2,'+
             '  PARA_VALUE_3, PARA_VALUE_4, PARA_VALUE_5, PARA_VALUE_6, PARA_VALUE_7, PARA_VALUE_8, PARA_VALUE_9,remark,if_read571) '+ #13#10 +
            ' values(%s,%s,%s,''%s'',''%s'',''%s'',''%s'',%s,%s,''%s'',''%s'', ' + #13#10 +
            ' %12.4f,%12.4f,%s,%12.4f,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s, ' + #13#10 +
            ' %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,''%s'',''%s'')',
      [key,
      DM.cds571recno_number.AsString,
      dm.cds571ttype.AsString,
      DM.cds571MANU_PART_NUMBER.AsString,
      DM.cds571MANU_PART_DESC.AsString,
      DM.cds571DEPT_PTR.AsString,
      DM.cds571PANEL_A_B.AsString,
      DM.cds571pan_qty.AsString,
      dm.cds571pcs_qty.AsString,
      DM.cds571pan_size.AsString,
      DM.cds571pcs_size.AsString,
      dm.cds571pan_sqrt.AsCurrency,
      DM.cds571pcs_sqrt.AsCurrency,
      DM.cds571layers.AsString,
      DM.cds571theory_result.AsCurrency,
      IfThen(DM.cds571PARA_PTR_0.IsNull,'null',DM.cds571PARA_PTR_0.AsString),
      IfThen(DM.cds571PARA_PTR_1.IsNull,'null',DM.cds571PARA_PTR_1.AsString),
      IfThen(DM.cds571PARA_PTR_2.IsNull,'null',DM.cds571PARA_PTR_2.AsString),
      IfThen(DM.cds571PARA_PTR_3.IsNull,'null',DM.cds571PARA_PTR_3.AsString),
      IfThen(DM.cds571PARA_PTR_4.IsNull,'null',DM.cds571PARA_PTR_4.AsString),
      IfThen(DM.cds571PARA_PTR_5.IsNull,'null',DM.cds571PARA_PTR_5.AsString),
      IfThen(DM.cds571PARA_PTR_6.IsNull,'null',DM.cds571PARA_PTR_6.AsString),
      IfThen(DM.cds571PARA_PTR_7.IsNull,'null',DM.cds571PARA_PTR_7.AsString),
      IfThen(DM.cds571PARA_PTR_8.IsNull,'null',DM.cds571PARA_PTR_8.AsString),
      IfThen(DM.cds571PARA_PTR_9.IsNull,'null',DM.cds571PARA_PTR_9.AsString),
      IfThen(DM.cds571PARA_VALUE_0.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_0.AsString)),
      IfThen(DM.cds571PARA_VALUE_1.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_1.AsString)),
      IfThen(DM.cds571PARA_VALUE_2.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_2.AsString)),
      IfThen(DM.cds571PARA_VALUE_3.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_3.AsString)),
      IfThen(DM.cds571PARA_VALUE_4.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_4.AsString)),
      IfThen(DM.cds571PARA_VALUE_5.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_5.AsString)),
      IfThen(DM.cds571PARA_VALUE_6.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_6.AsString)),
      IfThen(DM.cds571PARA_VALUE_7.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_7.AsString)),
      IfThen(DM.cds571PARA_VALUE_8.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_8.AsString)),
      IfThen(DM.cds571PARA_VALUE_9.IsNull,'null',QuotedStr(DM.cds571PARA_VALUE_9.AsString)),
      DM.cds571REMARK.AsString,
      DM.cds571if_read571.AsString]);
//    ShowMessage(dm.adoTmp.SQL.Text);
    dm.adoTmp.ExecSQL;
    DM.cds571.Next;
  end;
end;

procedure TfrmModify.DB571TitleClick(Column: TColumnEh);
begin
  if (Column.FieldName='perpanel_result') or (Column.FieldName='dept_name') then exit;
  if (Column.Title.Caption <> ReColumn.Title.Caption)
        and (Column.Field.DataType in [ftString, ftBCD,ftWideString, ftFloat, ftCurrency]) then
  begin
    Column.Title.Color:=clRed;
    ReColumn.Title.Color:=clBtnFace;
    ReColumn:=Column;
  end;
  DM.cds571.IndexDefs.Clear;
  WITH DM.cds571.IndexDefs.AddIndexDef do
  BEGIN
    Name:='F1';
    Fields:= Column.FieldName;
  end;
  with DM.cds571.IndexDefs.AddIndexDef DO
  BEGIN
    Name:='F2';
    Fields:= Column.FieldName;
    Options:= [ixDescending];
  END;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.cds571.IndexName:='F2';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.cds571.IndexName:='F1';
  end;
end;

procedure TfrmModify.dtpkStartDateChange(Sender: TObject);
begin
  DM.cds571.EmptyDataSet;
  DB571.SumList.Active:=false;
  edtSum.Text:='0';
  edtRec.Text:='0';
end;

procedure TfrmModify.btnCancelEnter(Sender: TObject);
begin
  if DM.cds571.State in [dsEdit,dsInsert] then DM.cds571.Cancel;
end;

function TfrmModify.CheckNull: Boolean;
var
  i:Integer;
begin
  Result:= False;
  DM.cds571.First;
  dm.cds571.DisableControls;
  try
    while not DM.cds571.Eof do
    begin
      for i:=0 to paraList.Count-1 do
      begin
        if StrToInt(paraList.Values[paraList.Names[i]]) = 1 then
        if DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).IsNull or (DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(i)).AsString = '0') then
        begin
          exit;
        end;
      end;
      DM.cds571.Next;
    end;
    Result:= True;
  finally
    DM.cds571.EnableControls;
  end;
end;

end.


