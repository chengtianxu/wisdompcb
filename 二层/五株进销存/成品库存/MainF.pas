unit MainF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ExtCtrls,OleServer,ComObj,ExcelXP, Excel2000,
  DBGrids, DBGridEh;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure a1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses common,UDM, UDTime, UDetail;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
   //DM.ADOConnection1.Open;

  //user_ptr := '3';
  //vprev := '4';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
     application.Terminate;
end;

procedure TMain_Form.FormShow(Sender: TObject);
var
    i:Integer;
begin
     sgrid1.Cells[0,0]:='序号';
     sgrid1.Cells[1,0]:='截数日期';
     sgrid1.Cells[2,0]:='截数人';
     sgrid1.Cells[3,0]:='';
     SGrid1.FixedRows:=1;
     sgrid1.ColWidths[3]:=0;
     if DM.ADOConnection1.Connected then
      begin
           DM.ADOTmp1.sql.Clear;
           DM.ADOTmp1.sql.Text:= ' select distinct stock_date,employee_name from product_stock order by stock_date'+#13;
           DM.ADOTmp1.Close ;
           DM.ADOTmp1.Open;
           if not DM.ADOTmp1.IsEmpty then
           begin
            DM.ADOTmp1.First;
            sgrid1.Cells[0,1]:='1(期初)';
            sgrid1.Cells[1,1]:=DM.ADOTmp1.fieldbyname('stock_date').AsString;
            sgrid1.Cells[2,1]:=DM.ADOTmp1.fieldbyname('employee_name').AsString;
            sgrid1.Cells[3,1]:='1';
            DM.ADOTmp1.Next;
            i:=2;
            while  not DM.ADOTmp1.Eof do
            begin
                sgrid1.RowCount := sgrid1.RowCount + 1;
                sgrid1.Cells[0,i]:=IntToStr(i);
                sgrid1.Cells[1,i]:=DM.ADOTmp1.fieldbyname('stock_date').AsString;
                sgrid1.Cells[2,i]:=DM.ADOTmp1.fieldbyname('employee_name').AsString;
                sgrid1.Cells[3,i]:=IntToStr(i);
                DM.ADOTmp1.Next;
                Inc(i);
            end;
           end;
           DM.ADOTmp1.First;
      end;
end;

procedure TMain_Form.N1Click(Sender: TObject);
var //从Excel中读取数据到 Grid
  iCount,jCount: Integer;
  XLApp, Sheet: variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

  if DM.ADOConnection1.Connected then
  begin
              try
               dm.ADOConnection1.BeginTrans;
                with DM.ADOTmp1 do
                begin
                        Close;
                        sql.Clear;
                        sql.Text:= ' CREATE TABLE #product_stock_tmp(  [rkey] [int] IDENTITY(1,1) NOT NULL, '+#13+
                                   '   [MANU_PART_NUMBER] [varchar](20) NULL, '+#13+
                                   ' [MANU_PART_DESC] [varchar](40) NULL, '+#13+
                                   ' [ANALYSIS_CODE_2] [varchar](50) NULL,'+#13+
                                   ' [PROD_CODE] [varchar](50) NULL, '+#13+
                                   ' [LAYERS] [tinyint] NULL, '+#13+
                                   ' [PRODUCT_NAME] [varchar](30) NULL,'+#13+
                                   ' [CUST_CODE] [varchar](50) NULL, '+#13+
                                   ' [ABBR_NAME] [varchar](16) NULL, '+#13+
                                   ' [quantity] [int] NULL, '+#13+
                                   ' [unit_sq] [float] NULL,'+#13+
                                   ' [stock_area] [decimal](12, 4) NULL, '+#13+
                                   ' [pcs_weight] [float] NULL, '+#13+
                                   ' [stock_weight] [decimal](12, 4) NULL, '+#13+
                                   ' [LOCATION] [varchar](20) NULL, '+#13+
                                   ' [stock_date] [smalldatetime] NULL,'+#13+
                                   ' [employee_name] [varchar](16) NULL )'+#13;
                        //ShowMessage(sql.Text);
                        ExecSQL;
                end;
                 dm.ADOConnection1.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dm.ADOConnection1.RollbackTrans;
                   messagedlg(E.Message,mterror,[mbcancel],0);
                 end;
              end;


      OpenDialog1.DefaultExt :='*.XLS';
      OpenDialog1.Filter :='*.XLS|*.XLS';
      if OpenDialog1.Execute then
      begin
        try
            XLApp.workBooks.Open(OpenDialog1.FileName);
             Sheet := XLApp.Workbooks[1].WorkSheets[1];
             DM.ADOStock1.DisableControls;
             DM.ADOStock1.Open;
             for iCount:=2 to 65535 do
             begin
                               if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then  break;
                               DM.ADOStock1.Append;
                               for jCount:=1 to 16 do
                                 DM.ADOStock1.Fields[jCount].Value:=sheet.cells[iCount,jCount];
             end;
             DM.ADOStock1.Post;
             XLApp.workbooks[1].close;
             with DM.ADOTmp1 do
             begin
                        Close;
                        sql.Clear;
                        sql.Text:= ' select * from #product_stock_tmp '+#13+
                                                '  where MANU_PART_NUMBER in (select   MANU_PART_NUMBER  from   #product_stock_tmp '+#13+
                                                '  group  by   MANU_PART_NUMBER  having  count(MANU_PART_NUMBER) > 1) '+#13;
                        Close;
                        Open;
                        if not DM.ADOTmp1.IsEmpty then
                        begin
                                   ShowMessage('您导入的数据中可能存在本厂编号重复，请修改后重新导入');
                                    try
                                     dm.ADOConnection1.BeginTrans;
                                              Close;
                                              sql.Clear;
                                              sql.Text:= ' drop table #product_stock_tmp';
                                              ExecSQL;
                                       dm.ADOConnection1.CommitTrans;
                                     except
                                       on E: Exception do
                                       begin
                                         dm.ADOConnection1.RollbackTrans;
                                         messagedlg(E.Message,mterror,[mbcancel],0);
                                       end;
                                    end;
                        end else begin
                                Close;
                                sql.Clear;
                                sql.Text:= ' select count(distinct stock_date)as num from  #product_stock_tmp '+#13;
                                Close;
                                Open;
                            if fieldbyname('num').AsInteger >= 2 then
                            begin
                                   ShowMessage('您导入的数据中日期有误，请修改后重新导入');
                                    try
                                          dm.ADOConnection1.BeginTrans;
                                             Close;
                                              sql.Clear;
                                              sql.Text:= ' drop table #product_stock_tmp';
                                              ExecSQL;
                                           dm.ADOConnection1.CommitTrans;
                                     except
                                       on E: Exception do
                                       begin
                                         dm.ADOConnection1.RollbackTrans;
                                         messagedlg(E.Message,mterror,[mbcancel],0);
                                       end;
                                    end;
                            end else begin
                                    try
                                     dm.ADOConnection1.BeginTrans;
                                      Close;
                                      sql.Clear;
                                      sql.Text:=  ' INSERT INTO product_stock( MANU_PART_NUMBER, MANU_PART_DESC, ANALYSIS_CODE_2, PROD_CODE, LAYERS, PRODUCT_NAME, CUST_CODE, ABBR_NAME, '+#13+
                                                  ' quantity, unit_sq, stock_area, pcs_weight, stock_weight, LOCATION, stock_date, employee_name)'+#13+
                                                  '(SELECT   MANU_PART_NUMBER, MANU_PART_DESC, ANALYSIS_CODE_2, PROD_CODE, LAYERS, PRODUCT_NAME, CUST_CODE, ABBR_NAME, '+#13+
                                                  ' quantity, unit_sq, stock_area, pcs_weight, stock_weight, LOCATION, stock_date, employee_name FROM #product_stock_tmp)'+#13;
                                      ExecSQL;
                                      dm.ADOConnection1.CommitTrans;
                                     except
                                       on E: Exception do
                                       begin
                                         dm.ADOConnection1.RollbackTrans;
                                         messagedlg(E.Message,mterror,[mbcancel],0);
                                       end;
                                    end;
                                Close;
                                sql.Clear;
                                sql.Text:= ' select stock_date,employee_name from product_stock'+#13;
                                Close;
                                Open;
                                sgrid1.Cells[0,1]:='1(期初)';
                                sgrid1.Cells[1,1]:=fieldbyname('stock_date').AsString;
                                sgrid1.Cells[2,1]:=fieldbyname('employee_name').AsString;
                                sgrid1.Cells[3,1]:= '1';
                                Close;
                                ShowMessage('期初导入成功');
                             end;
                        end;
             end;
        finally
             XLApp.quit;
             Screen.Cursor := crDefault;
        end;
      end;
      try
             dm.ADOConnection1.BeginTrans;
              with DM.ADOTmp1 do
              begin
                      Close;
                      sql.Clear;
                      sql.Text:= ' drop table #product_stock_tmp';
                      ExecSQL;
              end;
               dm.ADOConnection1.CommitTrans;
      except
               on E: Exception do
               begin
                 dm.ADOConnection1.RollbackTrans;
                 messagedlg(E.Message,mterror,[mbcancel],0);
               end;
      end;
      if  opendialog1.FileName=''   then
      Screen.Cursor := crDefault;
  end;
  DM.ADOStock1.Close;
  DM.ADOTmp1.Close;
end;

procedure TMain_Form.N2Click(Sender: TObject);
begin
   if  (StrToInt(SGrid1.Cells[3,SGrid1.Row]) <> SGrid1.RowCount-1)  then
   begin
         ShowMessage('此记录已有新的截数记录产生，请从最后一条记录开始截数');
         Abort;
   end else
   begin
            try
                Time_Form := TTime_Form.Create(application) ;
                if Time_Form.ShowModal = mrok then
                begin
                       if DM.ADOConnection1.Connected then
                       begin
                          try
                               DM.ADO05.Close ;
                               DM.ADO05.Parameters.ParamValues['user_ptr']:= user_ptr;
                               DM.ADO05.Open;

                               {DM.ADOTmp1.sql.Clear;
                               DM.ADOTmp1.sql.Text:= ' select distinct stock_date from invt_stock'+#13;
                               DM.ADOTmp1.Close;
                               DM.ADOTmp1.Open;
                               DM.ADOTmp1.Last; }
                               //ShowMessage();
                               with dm.ADOStoredProc1 do
                               begin
                                close;
                                ProcedureName:='wzprproduct_stock';
                                Parameters.Refresh;
                                parameters.ParamValues['@inputer']:= DM.ADO05.fieldbyname('EMPLOYEE_NAME').AsVariant;
                                parameters.ParamValues['@beg_date']:= StrToDate(SGrid1.Cells[1,SGrid1.RowCount-1]);
                                parameters.ParamValues['@end_date']:= Time_Form.DTPK1.Date;
                                //ShowMessage(DM.ADO05.fieldbyname('EMPLOYEE_NAME').AsString);
                                //ShowMessage(DM.ADOTmp1.fieldbyname('stock_date').AsString);
                                ExecProc;
                               end;
                              sgrid1.RowCount := sgrid1.RowCount + 1;
                              sgrid1.Cells[0,sgrid1.RowCount-1]:=IntToStr(sgrid1.RowCount-1);
                              sgrid1.Cells[1,sgrid1.RowCount-1]:=DateToStr(Time_Form.DTPK1.Date);
                              sgrid1.Cells[2,sgrid1.RowCount-1]:=DM.ADO05.fieldbyname('EMPLOYEE_NAME').AsString;
                              sgrid1.Cells[3,sgrid1.RowCount-1]:=IntToStr(sgrid1.RowCount-1);
                          except
                            on E: Exception do
                            begin
                                dm.ADOConnection1.RollbackTrans;
                                messagedlg(E.Message,mterror,[mbcancel],0);
                            end;
                          end;
                       end;
                end;
            finally
              Time_Form.Free ;
            end;
    end;
    DM.ADOTmp1.Close ;
    DM.ADO05.Close ;
end;

procedure TMain_Form.N3Click(Sender: TObject);
begin
    try
        Detail_Form := TDetail_Form.Create(application) ;
        Detail_Form.sdate:=' SELECT     rkey,MANU_PART_NUMBER, MANU_PART_DESC, ANALYSIS_CODE_2, PROD_CODE, LAYERS, PRODUCT_NAME, CUST_CODE, ABBR_NAME, quantity, '+#13+
                           ' unit_sq, stock_area, pcs_weight, stock_weight, LOCATION, stock_date, employee_name '+#13+
                           ' FROM   product_stock  '+#13+
                           ' WHERE  ( stock_date =  CONVERT(DATETIME,'+#39+SGrid1.Cells[1,SGrid1.Row]+#39+', 102))'+#13;
        if Detail_Form.ShowModal = mrok then
        begin

        end;

    finally
      Detail_Form.Free ;
    end;
    DM.ADOproduct_stock.Close ;
end;

procedure TMain_Form.N4Click(Sender: TObject);
var
    v_message:Integer;
begin
   if  (StrToInt(SGrid1.Cells[3,SGrid1.Row]) <> SGrid1.RowCount-1)  then
   begin
         ShowMessage('删除必须从最末截数记录开始，请从最后一条记录开始删除');
         Abort;

   end else
   begin
          if  SGrid1.Cells[3,SGrid1.Row] = '1'  then
          begin
                      v_message:=messagedlg('是否删除期初数据?',mtConfirmation,[mbyes,mbno],0);
                      if v_message=6 then
                      begin
                            if DM.ADOConnection1.Connected then
                           begin
                                  try
                                        dm.ADOConnection1.BeginTrans;
                                        DM.ADOTmp1.Close;
                                        DM.ADOTmp1.sql.Clear;
                                        DM.ADOTmp1.sql.Text:= ' DELETE from product_stock WHERE  ( stock_date =  CONVERT(DATETIME,'+#39+SGrid1.Cells[1,SGrid1.Row]+#39+', 102))'+#13;
                                        DM.ADOTmp1.ExecSQL;
                                        dm.ADOConnection1.CommitTrans;
                                  except
                                     on E: Exception do
                                     begin
                                       dm.ADOConnection1.RollbackTrans;
                                       messagedlg(E.Message,mterror,[mbcancel],0);
                                     end;
                                  end;
                           end;
                           sgrid1.Cells[0,1]:='';
                           sgrid1.Cells[1,1]:='';
                           sgrid1.Cells[2,1]:='';
                           sgrid1.Cells[3,1]:='';
                      end;
          end else
          begin
          v_message:=messagedlg('数据删除后将不可恢复，是否继续?',mtConfirmation,[mbyes,mbno],0);
          if v_message=6 then
          begin
                if DM.ADOConnection1.Connected then
               begin
                      try
                            dm.ADOConnection1.BeginTrans;
                            DM.ADOTmp1.Close;
                            DM.ADOTmp1.sql.Clear;
                            DM.ADOTmp1.sql.Text:= ' DELETE from product_stock WHERE  ( stock_date =  CONVERT(DATETIME,'+#39+SGrid1.Cells[1,SGrid1.Row]+#39+', 102))'+#13;
                            DM.ADOTmp1.ExecSQL;
                            dm.ADOConnection1.CommitTrans;
                      except
                         on E: Exception do
                         begin
                           dm.ADOConnection1.RollbackTrans;
                           messagedlg(E.Message,mterror,[mbcancel],0);
                         end;
                      end;
               end;
               SGrid1.RowCount:=SGrid1.RowCount-1;
          end;
     end;
   end;
end;

procedure TMain_Form.PopupMenu1Popup(Sender: TObject);
begin
    n1.Enabled := True;
    n2.Enabled := True;
    n3.Enabled := True;
    n4.Enabled := True;
    
    if SGrid1.RowCount=2 then
    begin
       if sgrid1.Cells[1,1] = '' then
       begin
            n2.Enabled := False;
            n3.Enabled := False;
            n4.Enabled := False;
       end else
           n1.Enabled := False;
    end;
    if SGrid1.RowCount>2 then
       n1.Enabled := False;
end;

procedure TMain_Form.a1Click(Sender: TObject);
begin
   // ShowMessage(SGrid1.Cells[3,SGrid1.Row]);
end;

procedure TMain_Form.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
  if Button = mbRight then
  begin
      SendMessage(SGrid1.Handle, WM_LBUTTONDOWN, 0, MAKELONG(x, y));
      SendMessage(SGrid1.Handle, WM_LBUTTONUP, 0, MAKELONG(x, y));
  end;
end;

end.
