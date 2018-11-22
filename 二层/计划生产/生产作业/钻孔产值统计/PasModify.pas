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
    edtStartDate: TEdit;
    edtEndDate: TEdit;
    Label3: TLabel;
    cbbWorkHour: TComboBox;
    PopupMenu1: TPopupMenu;
    nOpen: TMenuItem;
    nEdit: TMenuItem;
    Label8: TLabel;
    btnExpress: TBitBtn;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    procedure btnDepartClick(Sender: TObject);
    procedure edtDepartExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnCalcutlateClick(Sender: TObject);
    procedure edtStartDateExit(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure nOpenClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExpressClick(Sender: TObject);
    procedure edtExpressExit(Sender: TObject);
    procedure DB571KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    ibool:Boolean;
    function getPrice(key,row,col:string):string;
    function getHFPrice(MENU_NUMBER:string;theory:Currency):string ;
//    procedure update04(seed: string);
    procedure CheckOldData(MANU_NUMBER:string;dept_ptr:Integer);
//    procedure CheckOldData(MANU_NUMBER:string;iPara:Integer);
    { Private declarations }
  public
    status,rkey570:Integer;
    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses DAMO,Pick_Item_Single,ConstVar,DateUtils, PasParaEdit, PasTable,ADODB;

{$R *.dfm}

procedure TfrmModify.btnDepartClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'dept_code/工序代码/180,dept_name/工序名称/250';
    InputVar.Sqlstr := 'select rkey,dept_code,dept_name from data0034 where ttype=1 and ACTIVE_FLAG=0';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtDepart.Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').AsString;
      edtDepart.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.edtDepartExit(Sender: TObject);
begin
  if Trim(edtDepart.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,dept_code,dept_name from data0034 where ttype=1 and ACTIVE_FLAG=0 and dept_code='+ QuotedStr(Trim(edtDepart.Text));
      Open;
      if IsEmpty then
      begin
        ShowMessage('工序代码不存在或已失效，请重新输入');
        edtDepart.SetFocus;
        Exit;
      end
      else
      begin
        edtDepart.Tag:=FieldByName('rkey').AsInteger;
      end;
    end;
  end;
end;


procedure TfrmModify.FormShow(Sender: TObject);
var
  temp:TDateTime;
  i:Integer;
begin
  MyDataClass:=TMyDataClass.Create(DM.ADOConnection1);
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
  if status=1 then
  begin
    edtStartDate.Text:= FormatDateTime('yyyy-MM-dd', IncDay(temp,-1))+ ' 08:00:00';
    edtEndDate.Text:= FormatDateTime('yyyy-MM-dd', temp)+ ' 08:00:00';
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
    cbbWorkHour.Enabled:=False;
    edtDepart.Enabled:=False;
    edtExpress.Enabled:=False;
    btnExpress.Enabled:=False;
    with DM.adoTime do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select data0570.rkey,number,data0570.DEPT_PTR,data0034.dept_code, data0570.formula_number,data0569.theorycalc_meth, start_date, end_date, '+
                   ' theory_result, master_remark, warehouse_ptr,data0015.abbr_name '+ #13+
                   ' from data0570 inner join data0034 on data0570.dept_ptr=data0034.rkey '+ #13 +
                   ' inner join data0015 on data0570.warehouse_ptr=data0015.rkey '+ #13+
                   ' inner join data0569 on data0570.formula_number= data0569.formula_number '+ #13+
                   ' where data0570.rkey=' + IntToStr(rkey570);
      Open;
      if not IsEmpty then
      begin
        edtNO.Text:= FieldByName('number').AsString;
        edtStartDate.Text:=FieldByName('start_date').AsString;
        edtEndDate.Text:=FieldByName('end_date').AsString;
        edtSum.Text:=FieldByName('theory_result').AsString;
        edtDepart.Text:=FieldByName('dept_code').AsString;
        edtDepart.Tag:=FieldByName('DEPT_PTR').AsInteger;
        edtExpress.Text:=FieldByName('formula_number').AsString;
        edtExpress.Hint:=FieldByName('theorycalc_meth').AsString;
        Memo1.Lines.Text:=FieldByName('master_remark').AsString;
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
      Panel3.Enabled:=False;
      btnSave.Enabled:=False;
      btnLoad.Enabled:=False;
      btnCalcutlate.Enabled:=False;
    end;
  end;
  Label10.Caption:=IntToStr(DM.cds571.RecordCount);
end;

procedure TfrmModify.btnExportClick(Sender: TObject);
begin
  if  not DM.cds571.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(DB571,'产值明细');
end;

procedure TfrmModify.btnCalcutlateClick(Sender: TObject);
var
  strExpress,expressLeft,expressMid,ExpressRight:string;
  i,paraPos,endPos:Integer;
  lPos,mPos,rPos:Integer;
  paraValueLeft,paraValueRigth,rkey280:string;
  theory_result:string;
  theory_cur:Currency;
  temp:Currency;
  paraList:TStringList;
begin
  if DM.cds571.RecordCount=0 then Exit;
  if Trim(edtExpress.Hint)='' then
  begin
    ShowMessage('公式表达式为空，请先选择公式');
    edtExpress.SetFocus;
    Exit;
  end;
  if not ibool then
  begin
    DM.cds571.DisableControls;
    Screen.Cursor:=crHourGlass;

    DM.cds571.First;
    while not DM.cds571.Eof do
    begin
      strExpress:=edtExpress.Hint;
      strExpress:=StringReplace(strExpress,#13#10,'',[rfReplaceAll]);    //去回车换行;
      strExpress:=StringReplace(strExpress,' ','',[rfReplaceAll]);   //去空格
      strExpress:=StringReplace(strExpress,'pan_qty',DM.cds571pan_qty.AsString,[rfReplaceAll,rfIgnoreCase]);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select '+ strExpress +' as theory_result';
        Open;
        theory_result:=FieldByName('theory_result').AsString;
        theory_cur:=FieldByName('theory_result').AsCurrency;

        DM.cds571.Edit;
        DM.cds571theory_result.AsString:= theory_result;
        DM.cds571.Post;
      end;
      DM.cds571.Next;
    end;
    Screen.Cursor:=crDefault;
    DM.cds571.EnableControls;
  end
  else
  begin
    paraList:=TStringList.Create;
    paraList.Add('4层板');
    paraList.Add('多层钻孔');
    paraList.Add('板厚钻孔');
    DM.cds571.DisableControls;
    Screen.Cursor:=crHourGlass;
    try
      DM.cds571.First;
      while not DM.cds571.Eof do
      begin
        if (dm.cds571theory_result.AsString='') or (dm.cds571theory_result.AsString='0') then
        begin
  //        if (DM.cds571PARA_VALUE_0.AsString='') or (DM.cds571PARA_VALUE_1.AsString='') or (DM.cds571PARA_VALUE_2.AsString='') or (DM.cds571PARA_VALUE_3.AsString='') then
  //        begin
  //          dm.cds571.Next;
  //          Continue;
  //        end;
          if not (TryStrToCurr(DM.cds571PARA_VALUE_0.AsString,temp) and TryStrToCurr(DM.cds571PARA_VALUE_1.AsString,temp)
                                and TryStrToCurr(DM.cds571PARA_VALUE_2.AsString,temp) and TryStrToCurr(DM.cds571PARA_VALUE_3.AsString,temp)) then
          begin
            dm.cds571.Next;
            Continue;
          end;
          strExpress:=edtExpress.Hint;
          strExpress:=StringReplace(strExpress,#13#10,'',[rfReplaceAll]);    //去回车换行;
          strExpress:=StringReplace(strExpress,' ','',[rfReplaceAll]);   //去空格
          strExpress:=StringReplace(strExpress,'pan_qty',DM.cds571pan_qty.AsString,[rfReplaceAll,rfIgnoreCase]);
          strExpress:=StringReplace(strExpress,'LAYERS',DM.cds571LAYERS.AsString,[rfReplaceAll,rfIgnoreCase]);
          strExpress:=StringReplace(strExpress,'LAM_THK',DM.cds571PARA_VALUE_0.AsString,[rfReplaceAll,rfIgnoreCase]);
          strExpress:=StringReplace(strExpress,'DG-LITTDRL',DM.cds571PARA_VALUE_1.AsString,[rfReplaceAll,rfIgnoreCase]);
          strExpress:=StringReplace(strExpress,'DR_NUM',DM.cds571PARA_VALUE_2.AsString,[rfReplaceAll,rfIgnoreCase]);
          strExpress:=StringReplace(strExpress,'DGNUMBER',DM.cds571PARA_VALUE_3.AsString,[rfReplaceAll,rfIgnoreCase]);
          for i:=0 to paraList.Count-1 do
          begin
            paraPos:=Pos(paraList[i],strExpress);
            if paraPos<>0 then
            begin
              expressLeft:=Copy(strExpress,1,paraPos-1);
              endPos:=Pos(')',strExpress);
              ExpressRight:=Copy(strExpress,endPos+1,Length(strExpress)- endPos);
              expressMid:=Copy(strExpress,paraPos,endPos - paraPos+1 );
      //        ShowMessage(expressLeft+#13+ expressMid +#13+ ExpressRight);
              lPos:=Pos('(',expressMid);
              mPos:=Pos(',',expressMid);
              rPos:=Pos(')',expressMid);
              paraValueLeft:=Copy(expressMid,lPos+1,mPos-lpos-1);
              paraValueRigth:=Copy(expressMid,mPos+1,rPos-mpos-1);
              with DM.adoTmp do
              begin
                Close;
                SQL.Clear;
                SQL.Text:='select rkey from data0280 where eng_table_name = '+ QuotedStr(paraList[i]);
                Open;
                if not IsEmpty then
                begin
                  rkey280:=FieldByName('rkey').AsString;
                end;
              end;
              expressMid:=getPrice(rkey280,paraValueLeft,paraValueRigth);
              strExpress:=expressLeft + expressMid + ExpressRight;
            end;
          end;
    //      ShowMessage(strExpress);
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select '+ strExpress +' as theory_result';
            Open;
            theory_result:=FieldByName('theory_result').AsString;
            theory_cur:=FieldByName('theory_result').AsCurrency;
            theory_result:=getHFPrice(DM.cds571MANU_PART_NUMBER.AsString,theory_cur);
            //theory_total:= theory_total+ FieldByName('theory_result').AsCurrency;
            DM.cds571.Edit;
            DM.cds571theory_result.AsString:= theory_result;
            DM.cds571.Post;
          end;
        end;
        DM.cds571.Next;
      end;
      DM.cds571.EnableControls;
      Screen.Cursor:=crDefault;
    except
      on E: Exception do
      begin
        Screen.Cursor:=crDefault;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TfrmModify.edtStartDateExit(Sender: TObject);
var
  temp:TDateTime;
begin
//  if Trim((Sender as TEdit).Text)='' then Exit;
  if TryStrToDateTime(Trim((Sender as TEdit).Text),temp)= False then
  begin
    ShowMessage('输入的时间格式不对，请重新输入！' + #13+ '应如：2015-01-01 08:00:00');
    (Sender as TEdit).SetFocus;
    Exit;
  end
  else
  (Sender as TEdit).Text:=FormatDateTime('yyyy-MM-dd HH:MM:SS',temp);
end;

function TfrmModify.getPrice(key, row, col: string): string;
var
  irow,icol,iPrice:string;
begin
//  ShowMessage('1');
  iPrice:='1';
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select top 1 Tvalue,col from data0282 where eng_table_ptr= '+ key + ' and row_index=1 and cast(tvalue as decimal(20,8))>= '+ QuotedStr(col);
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
    SQL.Text:='select  top 1 Tvalue,row_index from data0282 where eng_table_ptr= '+ key + ' and col=1 and cast(tvalue as decimal(20,8))>= '+ QuotedStr(row);
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
    SQL.Text:='select top 1 Tvalue from data0282 where eng_table_ptr= '+ key + ' and row_index='+ irow+ ' and col='+ icol;
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

procedure TfrmModify.CheckOldData(MANU_NUMBER: string;dept_ptr:Integer);
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select top 1 data0571.Statistic_ptr,data0571.MANU_PART_NUMBER,PARA_VALUE_0,PARA_VALUE_1,PARA_VALUE_2,PARA_VALUE_3 '+  #13+
              ' from data0571 inner join data0570 on data0571.statistic_ptr=data0570.rkey '+ #13+
              ' where data0570.dept_ptr=' + IntToStr(dept_ptr) + ' and data0571.MANU_PART_NUMBER='+ QuotedStr(MANU_NUMBER) +#13+
              ' order by data0571.Statistic_ptr DESC';
    Open;
    if not IsEmpty then
    begin
        DM.cds571.Edit;
        DM.cds571.FieldByName('PARA_VALUE_0').AsString:=FieldByName('PARA_VALUE_0').AsString;
        DM.cds571.FieldByName('PARA_VALUE_1').AsString:=FieldByName('PARA_VALUE_1').AsString;
        DM.cds571.FieldByName('PARA_VALUE_2').AsString:=FieldByName('PARA_VALUE_2').AsString;
        DM.cds571.FieldByName('PARA_VALUE_3').AsString:=FieldByName('PARA_VALUE_3').AsString;
        dm.cds571if_read571.Value:='Y';
        DM.cds571.Post;

//      if FieldByName('PARA_VALUE_'+ IntToStr(iPara)).AsString<>'' then
//      begin
//        DM.cds571.Edit;
//        DM.cds571.FieldByName('PARA_VALUE_'+ IntToStr(iPara)).AsString:=FieldByName('PARA_VALUE_'+ IntToStr(iPara)).AsString;
//        DM.cds571.Post;
//      end;
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
  rec_no,custRkey,i,vPos,vPos2,vPos3:Integer;
  think_value:string;
  temp:Currency;
  strSlot:string;
  normalDock,slotDock,tempInt:Integer;
begin
  if DM.cds571.RecordCount<>0 then
  begin
    if MessageDlg('重新读取会清除现有读取的数据，是否继续？',mtWarning,[mbYes,mbNo],0)=mrno then Exit
    else DM.cds571.EmptyDataSet;
  end;

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
  if StrToDateTime(trim(edtStartDate.Text))>= StrToDateTime(Trim(edtEndDate.Text)) then
  begin
    ShowMessage('开始时间不能大于结束时间');
    edtStartDate.SetFocus;
    exit;
  end;

  rec_no:=1;
  try
    DM.cds571.DisableControls;
    Screen.Cursor:=crHourGlass;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT     TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.LAYERS, dbo.Data0025.ttype, '+
                '        dbo.Data0010.CUST_CODE, dbo.Data0006.pnl_size, dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 AS pan_sqrt, '+
                '        dbo.Data0025.ANALYSIS_CODE_5, dbo.Data0025.unit_sq, CASE dbo.Data0006.PANEL_A_B WHEN 0 THEN ''APNL'' ELSE ''BPNL'' END AS panel_ab,  '+
                '        SUM(dbo.Data0048.PANELS) AS pan_total, SUM(dbo.Data0048.QTY_PROD) AS pcs_total, '+
                '       SUM(dbo.Data0048.PANELS * dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001) as total_sqrt '+ #13+
                '  FROM         dbo.Data0048 INNER JOIN '+  #13+
                '        dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNER JOIN  '+  #13+
                '        dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN   '+   #13+
                '        dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN   '+   #13+
                '       dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY  '+  #13+
                '  WHERE     (dbo.Data0048.OUTTIME >= '+ QuotedStr(Trim(edtStartDate.Text)) +') AND (dbo.Data0048.OUTTIME <= '+ QuotedStr(Trim(edtEndDate.Text)) +
                '        ) AND (dbo.Data0048.warehouse_ptr = '+ IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) +') AND (dbo.Data0048.FM_DEPT_PTR = '+
                         IntToStr(edtDepart.Tag ) +') and dbo.data0048.wtype<>3'+#13+
                '  GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, dbo.Data0006.panel_ln,   '+
                 '       dbo.Data0006.panel_wd, dbo.Data0006.pnl_size, dbo.Data0025.LAYERS, dbo.Data0025.ttype, dbo.Data0006.PANEL_A_B, dbo.Data0025.unit_sq,  '+
                 '       dbo.Data0025.ANALYSIS_CODE_5';
  //    ShowMessage(SQL.text);
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
      end;
    end;

    if ibool then
    begin
      with DM.adoTmp do                                       //更新参数RKEY
      begin
        Close;
        SQL.Clear;
        SQL.Text:='SELECT     dbo.DATA0569.PARA_PTR_0, dbo.DATA0569.PARA_PTR_1, dbo.DATA0569.PARA_PTR_2, dbo.DATA0569.PARA_PTR_3 '+#13+
                   ' FROM    dbo.DATA0569  where dept_ptr= '+ IntToStr(edtDepart.Tag);
        Open;
        if not IsEmpty then
        begin
          DM.cds571.First;
          while not DM.cds571.Eof do
          begin
            dm.cds571.Edit;
            DM.cds571PARA_PTR_0.AsInteger:=FieldByName('PARA_PTR_0').AsInteger;
            DM.cds571PARA_PTR_1.AsInteger:=FieldByName('PARA_PTR_1').AsInteger;
            DM.cds571PARA_PTR_2.AsInteger:=FieldByName('PARA_PTR_2').AsInteger;
            DM.cds571PARA_PTR_3.AsInteger:=FieldByName('PARA_PTR_3').AsInteger;
            DM.cds571.Post;
            DM.cds571.Next;
          end;
        end;
      end;

      DM.cds571.First;
      while not DM.cds571.Eof do
      begin
        normalDock:=0;
        slotDock:=0;

  //      CheckOldData(DM.cds571MANU_PART_NUMBER.AsString,edtDepart.Tag);          //如果571中存在就从571里取值
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey from data0025 where manu_part_number='+ QuotedStr(DM.cds571MANU_PART_NUMBER.AsString);
          Open;
          if not IsEmpty then
          begin
            custRkey:=FieldByName('rkey').AsInteger;
          end;
        end;
        if DM.cds571.FieldByName('PARA_VALUE_0').AsString='' then                         //更新参数值0
        begin
              with DM.adoTime do
              begin
                Close;
                SQL.Clear;
                SQL.Text:='select d279.parameter_value,d278.parameter_name,d279.source_ptr '+#13+
                               ' from data0279 d279 inner join data0278 d278 on d278.rkey=d279.parameter_ptr  '+#13+
                               ' where d279.source_ptr= ' + IntToStr(custRkey) +' and d278.parameter_name =''完成板厚mm''';
                Open;
                if (not IsEmpty) and TryStrToCurr(FieldByName('PARAMETER_VALUE').AsString,temp) and
                    (FieldByName('PARAMETER_VALUE').AsString<>'.') then
                begin
                  DM.cds571.Edit;
                  DM.cds571PARA_VALUE_0.AsString:=CurrToStr(temp);
                  DM.cds571.Post;
                end
                else
                begin
                  DM.cds571.Edit;
                  DM.cds571PARA_VALUE_0.Value:='';
                  DM.cds571.Post;
                end;
              end;
  //        with DM.adoTmp do
  //        begin
  //          Close;
  //          SQL.Clear;
  //          SQL.Text:='SELECT  top 1   dbo.Data0494.PARAMETER_VALUE,dbo.Data0494.step_number, dbo.Data0278.PARAMETER_NAME, dbo.Data0494.custpart_ptr,step_number  '+#13+
  //                    'FROM         dbo.Data0494 INNER JOIN  '+#13+
  //                    '                      dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.RKEY  '+#13+
  //                    'WHERE     dbo.Data0278.RKEY='+ DM.cds571PARA_PTR_0.AsString +'  AND dbo.Data0494.custpart_ptr = '+ IntToStr(custRkey) +#13+
  //                    'ORDER BY  dbo.Data0494.step_number ';
  //          Open;
  //          if not IsEmpty then
  //          begin
  //            DM.cds571.Edit;
  //            DM.cds571PARA_VALUE_0.AsString:=FieldByName('PARAMETER_VALUE').AsString;
  //            DM.cds571.Post;
  //          end
  //          else
  //          begin
  //

  //          with DM.adoTime do
  //          begin
  //            Close;
  //            SQL.Clear;
  //            SQL.Text:='SELECT  top 1   dbo.Data0494.PARAMETER_VALUE, dbo.Data0494.step_number,dbo.Data0278.PARAMETER_NAME, dbo.Data0494.custpart_ptr,step_number  '+#13+
  //                      'FROM         dbo.Data0494 INNER JOIN  '+#13+
  //                      '                      dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.RKEY  '+#13+
  //                      'WHERE     dbo.Data0278.PARAMETER_NAME = ''CY_THK'' AND dbo.Data0494.custpart_ptr = '+ IntToStr(custRkey)+#13+
  //                      'ORDER BY  dbo.Data0494.step_number ';
  //            Open;
  //            if not IsEmpty then
  //            begin
  //              think_value:=FieldByName('PARAMETER_VALUE').AsString;
  //              vPos:=Pos('+/-',think_value);
  //              vPos2:=Pos('±',think_value);
  //              vPos3:=Pos('mm+/-',think_value);
  //              if vPos>0 then think_value:=Trim(Copy(think_value,1,vPos-1));
  //              if vPos2>0 then think_value:=Trim(Copy(think_value,1,vPos2-1));
  //              if vPos3>0 then think_value:=Trim(Copy(think_value,1,vPos3-1));
  ////              if TryStrToCurr(think_value,temp)=False then think_value:='';
  //              DM.cds571.Edit;
  //              DM.cds571PARA_VALUE_0.AsString:=think_value;
  //              DM.cds571.Post;
  //            end;

  //          end;
  //        end;
        end;


        if DM.cds571.FieldByName('PARA_VALUE_1').AsString='' then
        begin
        with DM.adoTmp do                                                 //更新参数值1
        begin
          Close;
          SQL.Clear;
          SQL.Text:='SELECT   dbo.Data0494.PARAMETER_VALUE, dbo.Data0278.PARAMETER_NAME, dbo.Data0494.custpart_ptr '+ #13+
                    '  FROM         dbo.Data0494 INNER JOIN  '+ #13+
                    '                        dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.RKEY   '+ #13+
                    ' WHERE     (dbo.Data0278.rkey='+ IntToStr(DM.cds571PARA_PTR_1.AsInteger) +') AND (dbo.Data0494.custpart_ptr = '+ IntToStr(custRkey) +')';
          Open;
          if not IsEmpty then
          begin
            DM.cds571.Edit;
            DM.cds571PARA_VALUE_1.AsString:=FieldByName('PARAMETER_VALUE').AsString;
            DM.cds571.Post;
          end;
        end;
        end;

        if (DM.cds571.FieldByName('PARA_VALUE_2').AsString='') or (DM.cds571.FieldByName('PARA_VALUE_3').AsString='') then
        begin
        with DM.adoTmp do                                                     //更新参数值2，3
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey,HOLES_DIA,UNIT,panel_a from data0029 where SOURCE_PTR='+ IntToStr(custRkey)+ ' order by rkey';
          Open;
          if not IsEmpty then
          begin
            First;
            while not Eof do
            begin
              if  UpperCase(FieldByName('UNIT').AsString)='TOTAL:' then Break;
              if  (Pos('*',FieldByName('HOLES_DIA').AsString)=0) and (Pos('X',FieldByName('HOLES_DIA').AsString)=0)
                  and (Pos('x',FieldByName('HOLES_DIA').AsString)=0) then
              begin
                if (FieldByName('panel_a').AsString<>'') and (TryStrToInt(FieldByName('panel_a').AsString,tempInt)=True) then
                    normalDock:=normalDock+ FieldByName('panel_a').AsInteger;
              end
              else
              begin
                if (FieldByName('panel_a').AsString<>'') and (TryStrToInt(FieldByName('panel_a').AsString,tempInt)=True) then
                begin
                   strSlot:= FieldByName('UNIT').AsString;
                   vPos:= Pos('(',strSlot);
                   if vPos>0 then
                   begin
                     vPos2:=Pos(')',strSlot);
                     strSlot:=Copy(strSlot,vPos+1,vPos2 - vPos - 1);
                     if TryStrToInt(strSlot,tempInt) then
                     slotDock:=slotDock+ (StrToInt(strSlot) * FieldByName('panel_a').AsInteger);
                   end
                   else
                   begin
                     slotDock:=slotDock+ FieldByName('panel_a').AsInteger;
                   end;
                end;
              end;
              Next;
            end;
            DM.cds571.Edit;
            DM.cds571PARA_VALUE_2.AsString:=IntToStr(normalDock);
            DM.cds571PARA_VALUE_3.AsString:=IntToStr(slotDock);
            DM.cds571.Post;
          end;
        end;
        end;
        DM.cds571.Next;

      end;
    end;
    DM.cds571.EnableControls;
    Screen.Cursor:=crDefault;
    Label10.Caption:=IntToStr(DM.cds571.RecordCount);
  except
    on E: Exception do
    begin
      Screen.Cursor:=crDefault;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmModify.nOpenClick(Sender: TObject);
var
  MANU_NUMBER:string;
begin
  if DM.cds571MANU_PART_NUMBER.AsString<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey from data0025 where MANU_PART_NUMBER='+ QuotedStr(DM.cds571MANU_PART_NUMBER.AsString);
      Open;
      if not IsEmpty then MANU_NUMBER:=FieldByName('rkey').AsString;
    end;  
    try
      frmTable:=TfrmTable.Create(Application);
      frmTable.rkey25:=MANU_NUMBER;
      frmTable.ShowModal;
    finally
      frmTable.Free;
    end;
  end;
end;

procedure TfrmModify.nEditClick(Sender: TObject);
begin
  if DM.cds571MANU_PART_NUMBER.AsString='' then Exit;
  try
    frmParaEdit:=TfrmParaEdit.Create(Application);
    frmParaEdit.edtThink.Text:=DM.cds571PARA_VALUE_0.AsString;
    frmParaEdit.edtMid.Text:=DM.cds571PARA_VALUE_1.AsString;
    frmParaEdit.edtNormal.Text:=DM.cds571PARA_VALUE_2.AsString;
    frmParaEdit.edtSlot.Text:=DM.cds571PARA_VALUE_3.AsString;
    if frmParaEdit.ShowModal=mryes then
    begin
      DM.cds571.Edit;
      DM.cds571PARA_VALUE_0.AsString:=Trim(frmParaEdit.edtThink.Text);
      DM.cds571PARA_VALUE_1.AsString:=Trim(frmParaEdit.edtMid.Text);
      DM.cds571PARA_VALUE_2.AsString:=Trim(frmParaEdit.edtNormal.Text);
      DM.cds571PARA_VALUE_3.AsString:=Trim(frmParaEdit.edtSlot.Text);
      DM.cds571.Post;
    end;
  finally
    frmParaEdit.Free;
  end;
end;


procedure TfrmModify.btnSaveClick(Sender: TObject);
var
  key570,strSQL: string;
  rkey04:Integer;
begin
  
  try
    if DM.cds571.RecordCount>0 then
    begin
      if status=1 then
      begin
        if cbbWorkHour.ItemIndex=-1 then
        begin
          ShowMessage('请先选择工厂');
          cbbWorkHour.SetFocus;
          Exit;
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
                     ' Statistic_date, theory_result, master_remark, warehouse_ptr)' + #13 +
                     ' values(' + QuotedStr(Trim(edtNO.Text)) + ',1,0,' + IntToStr(edtDepart.Tag) + ',' + QuotedStr(Trim(edtExpress.Text))+
                     ',' + QuotedStr(Trim(edtStartDate.Text)) + ',' + QuotedStr(Trim(edtEndDate.Text)) + ',' + user_ptr +
                     ',' + QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1))) + ',' + Trim(edtSum.Text) + ',' +
                     QuotedStr(Memo1.Lines.Text) + ',' + IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex])) + ')';
          ShowMessage(SQL.Text);
          ExecSQL;
        end;

        Update_Seed(rkey04);
        with dm.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey from data0570 where number=' + QuotedStr(Trim(edtNO.Text));
          Open;
          if not IsEmpty then
          begin
            key570:=FieldByName('rkey').AsString;
          end;
        end;
        DM.cds571.DisableControls;
        DM.cds571.First;
        while not DM.cds571.Eof do
        begin
          strSQL:= 'insert data0571(Statistic_ptr, recno_number, ttype, MANU_PART_NUMBER, MANU_PART_DESC,PANEL_A_B, '+
                   ' pan_qty, pcs_qty, pan_size,pcs_size, pan_sqrt, pcs_sqrt, LAYERS, theory_result, PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, '+
                   '  PARA_PTR_3, PARA_VALUE_0, PARA_VALUE_1,PARA_VALUE_2, PARA_VALUE_3,remark,if_read571) '+ #13+
                   ' values('+ key570 + ',' + DM.cds571recno_number.AsString + ',' + dm.cds571ttype.AsString + ',' + QuotedStr(DM.cds571MANU_PART_NUMBER.AsString) +
                   ',' + QuotedStr(DM.cds571MANU_PART_DESC.AsString) + ',' + QuotedStr(DM.cds571PANEL_A_B.AsString) + ',' + DM.cds571pan_qty.AsString +
                   ',' + dm.cds571pcs_qty.AsString + ',' + QuotedStr(DM.cds571pan_size.AsString) + ',' + QuotedStr(DM.cds571pcs_size.AsString) +
                   ',' +  FormatCurr('0.0000',dm.cds571pan_sqrt.AsCurrency) + ',' + FormatCurr('0.0000',DM.cds571pcs_sqrt.AsCurrency) +
                   ',' + DM.cds571layers.AsString + ',' + FormatCurr('0.0000',DM.cds571theory_result.AsCurrency) + ',' + DM.cds571PARA_PTR_0.AsString +
                   ',' + DM.cds571PARA_PTR_1.AsString + ',' + DM.cds571PARA_PTR_2.AsString + ',' + DM.cds571PARA_PTR_3.AsString +
                   ',' + QuotedStr(DM.cds571PARA_VALUE_0.AsString) + ',' + QuotedStr(DM.cds571PARA_VALUE_1.AsString) + ',' + QuotedStr(DM.cds571PARA_VALUE_2.AsString) +
                   ',' + QuotedStr(DM.cds571PARA_VALUE_3.AsString)+ ',' + QuotedStr(DM.cds571REMARK.AsString)+',' + QuotedStr(DM.cds571if_read571.AsString) +')'+ #13+ strSql;
           DM.cds571.Next;
        end;
        ShowMessage(strSQL);
        DM.cds571.EnableControls;
        with dm.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=strSQL;
          ExecSQL;
        end;
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
                  ', start_date='+ QuotedStr(Trim(edtStartDate.Text))+', end_date='+ QuotedStr(Trim(edtEndDate.Text))+
                  ', EMPL_PTR='+ user_ptr+',Statistic_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1)))+
                  ', theory_result='+Trim(edtSum.Text)+', master_remark='+ QuotedStr(Memo1.Lines.Text)+
                  ', warehouse_ptr='+ IntToStr(Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex]))+ #13+
                  ' where rkey='+ IntToStr(rkey570);
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        DM.cds571.DisableControls;
        DM.cds571.First;
        while not DM.cds571.Eof do
        begin
          strSQL:= 'insert data0571(Statistic_ptr, recno_number, ttype, MANU_PART_NUMBER, MANU_PART_DESC,PANEL_A_B, '+
                   ' pan_qty, pcs_qty, pan_size,pcs_size, pan_sqrt, pcs_sqrt, LAYERS, theory_result, PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, '+
                   '  PARA_PTR_3, PARA_VALUE_0, PARA_VALUE_1,PARA_VALUE_2, PARA_VALUE_3,remark,if_read571) '+ #13+
                   ' values('+ IntToStr(rkey570) + ',' + DM.cds571recno_number.AsString + ',' + dm.cds571ttype.AsString + ',' + QuotedStr(DM.cds571MANU_PART_NUMBER.AsString) +
                   ',' + QuotedStr(DM.cds571MANU_PART_DESC.AsString) + ',' + QuotedStr(DM.cds571PANEL_A_B.AsString) + ',' + DM.cds571pan_qty.AsString +
                   ',' + dm.cds571pcs_qty.AsString + ',' + QuotedStr(DM.cds571pan_size.AsString) + ',' + QuotedStr(DM.cds571pcs_size.AsString) +
                   ',' +  FormatCurr('0.0000',dm.cds571pan_sqrt.AsCurrency) + ',' + FormatCurr('0.0000',DM.cds571pcs_sqrt.AsCurrency) +
                   ',' + DM.cds571layers.AsString + ',' + FormatCurr('0.0000',DM.cds571theory_result.AsCurrency) + ',' + DM.cds571PARA_PTR_0.AsString +
                   ',' + DM.cds571PARA_PTR_1.AsString + ',' + DM.cds571PARA_PTR_2.AsString + ',' + DM.cds571PARA_PTR_3.AsString +
                   ',' + QuotedStr(DM.cds571PARA_VALUE_0.AsString) + ',' + QuotedStr(DM.cds571PARA_VALUE_1.AsString) + ',' + QuotedStr(DM.cds571PARA_VALUE_2.AsString) +
                   ',' + QuotedStr(DM.cds571PARA_VALUE_3.AsString)+ ',' + QuotedStr(DM.cds571REMARK.AsString)+ ',' + QuotedStr(DM.cds571if_read571.AsString) +')'+ #13+ strSql;
           DM.cds571.Next;
        end;
        DM.cds571.EnableControls;
        with dm.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=strSQL;
          ExecSQL;
        end;
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
                      ' where  data0569.formula_number like ''%DR%''';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtExpress.Text:= frmPick_Item_Single.adsPick.fieldbyname('formula_number').AsString;
      edtExpress.Hint:= frmPick_Item_Single.adsPick.fieldbyname('theorycalc_meth').AsString;
      edtDepart.Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').AsString;
      edtDepart.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
      if edtDepart.Text='DR' then ibool:=True
      else ibool:=False;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

//procedure TfrmModify.update04(seed: string);
//var
//  i,strLeng:Integer;
//  strLast,newstr:string;
//begin
//  strLeng:=Length(seed);
//  for i:=strLeng downto 1 do
//  begin
//    if not (seed[i] in ['0'..'9']) then                //power 求幂数  10的strleng-1次方
//    begin
//      strLast:=FloatToStr(Power(10,strLeng-1)+ StrToFloat(Copy(seed,i+1,strLeng-i))+1);     // 把后面的数字加1
//      newstr:=Copy(seed,1,i) + Copy(strLast,i+1,strLeng-i);
//      with DM.adoTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:='update data0004 set seed_value='+ QuotedStr(newstr)+ 'where table_name=''data0570''';
//        ExecSQL;
//      end;
//      Break;
//    end;
//    if i=1 then
//    begin
//      strLast:=FloatToStr(Power(10,strLeng)+ StrToFloat(Copy(seed,1,strLeng))+1);
//      newstr:=Copy(seed,2,strLeng);
//      with DM.adoTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:='update data0004 set seed_value='+ QuotedStr(newstr)+ 'where table_name=''data0570''';
//        ExecSQL;
//      end;
//    end;
//  end;
//end;

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
                'where data0569.formula_number='+ QuotedStr(Trim(edtExpress.Text));
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
end;

function TfrmModify.getHFPrice(MENU_NUMBER: string; theory:Currency): string;
var
  tmpsql,R_theory:string;
  aqtmp:TADOQuery;
begin
  try
    Result:= CurrToStr(theory);
    aqtmp:= TADOQuery.Create(nil);
    aqtmp.Connection:= DM.ADOConnection1;

    tmpsql:='SELECT     dbo.Data0025.rkey,dbo.Data0007.PR_GRP_CODE '+#13+
             ' FROM         dbo.Data0025 INNER JOIN   '+#13+
             '           dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN  '+#13+
             '           dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY  '+#13 +
             ' where dbo.Data0007.PR_GRP_CODE=''HF'' and dbo.Data0025.MANU_PART_NUMBER='+ QuotedStr(MENU_NUMBER);
    if MyDataClass.OpenQuery(aqtmp,tmpsql) then
    begin
      if not aqtmp.IsEmpty then
      begin
        Result:=CurrToStr(theory*6);
      end;
    end;
  finally
    aqtmp.Free;
  end;
end;

end.
