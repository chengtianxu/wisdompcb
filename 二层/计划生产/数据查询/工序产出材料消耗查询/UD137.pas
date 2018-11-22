unit UD137;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,
  TeEngine, Series, TeeProcs, Chart, Menus, ExtDlgs,TeePrevi, ppBands,
  ppPrnabl, ppClass, ppCtrls, ppChrt, ppDB, ppCache, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, DBGrids,StrUtils;

type
  TMain_form = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Bar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    Series1: TBarSeries;
    Series2: TLineSeries;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    Edit1: TEdit;
    Label1: TLabel;
    UpDown2: TUpDown;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SpeedButton5: TSpeedButton;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    Label7: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid1: TDBGrid;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
  procedure init;
    { Private declarations }
  public
  PreColumn: TColumnEh;
  field_name:string;
  sSql1,sSql2 :string;
  procedure  item_click(sender: TObject);

  { Public declarations }
  end;

var
  Main_form: TMain_form;

implementation

uses UDM137,common, UWZ137,constvar,DateUtils;

{$R *.dfm}

procedure TMain_form.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;    {}   
  Caption := application.Title;
  dm.ADOConnection1.Open;
 { user_ptr := '3';
  vprev := '4';  { }  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADO137.SQL.Text);
end;

procedure TMain_form.DBGridEh1TitleClick(Column: TColumnEh);
begin
if  DBGridEh1.DataSource.DataSet.Active then
begin
if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
begin
   column.Title.SortMarker:=smUpEh;
   dm.ADO137.Sort:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
    dm.ADO137.Sort:=Column.FieldName+' DESC';
end;

if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
    begin
        self.field_name:=column.FieldName;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
    end;
  end;
end;
procedure TMain_form.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'工序产出材料消耗查询') ;

end;

procedure TMain_Form.init;
begin

    ssql1:=   ' SELECT     dbo.DATA0137.curr_date, dbo.DATA0137.production_area AS avlage_area,   '+#13+
              ' dbo.DATA0137.take_out AS total_takeout,   dbo.DATA0137.stan_consume AS avlage_consume,   '+#13+
              '        CASE dbo.DATA0137.take_out WHEN 0 THEN 0 ELSE  '+#13+
              '  case dbo.DATA0137.production_area when 0 then 0 else '+#13+
               '     (dbo.DATA0137.take_out / (dbo.DATA0137.production_area/1000)) END END AS actual_consume,  '+#13+
              '        CASE dbo.DATA0137.take_out WHEN 0 THEN 0    '+#13+
              '   ELSE (dbo.DATA0137.production_area / dbo.DATA0137.take_out - dbo.DATA0137.stan_consume)  '+#13+
              '        END AS diff, dbo.Data0002.UNIT_NAME, dbo.Data0015.ABBR_NAME  '+#13+
              '  FROM         dbo.DATA0137 INNER JOIN   '+#13+
              '        dbo.DATA0136 INNER JOIN   '+#13+
              '        dbo.Data0002 ON dbo.DATA0136.unit_ptr = dbo.Data0002.RKEY INNER JOIN  '+#13+
              '        dbo.Data0015 ON dbo.DATA0136.warehouse_ptr = dbo.Data0015.RKEY ON   '+#13+
              ' dbo.DATA0137.control_ptr = dbo.DATA0136.rkey  '+#13+
              'WHERE '+#13+
              '(1=1) '+#13+#13+#13;  
 {   ssql1:=    'SELECT       dbo.DATA0137.curr_date, '+#13
                      	+'dbo.DATA0137.production_area AS avlage_area, '+#13
 			                  +'dbo.DATA0137.take_out AS total_takeout, '+#13
			                  +'dbo.DATA0137.stan_consume AS avlage_consume, '+#13
                     	  +'case dbo.DATA0137.take_out when 0 then 0 else '+#13
                     	  +'(dbo.DATA0137.production_area/dbo.DATA0137.take_out) end as actual_consume, '+#13
                     	  +'case dbo.DATA0137.take_out when 0 then 0 else '+#13
                     	  +'(dbo.DATA0137.production_area/dbo.DATA0137.take_out - dbo.DATA0137.stan_consume) end as diff  '+#13
          +'FROM                 	dbo.DATA0137 INNER JOIN  '+#13
                      	+'dbo.Data0002 ON dbo.DATA0137.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+#13
                      	+'dbo.Data0034 ON dbo.DATA0137.dept_ptr = dbo.Data0034.RKEY INNER JOIN  '+#13
                      	+'dbo.Data0017 ON dbo.DATA0137.invt_ptr = dbo.Data0017.RKEY INNER JOIN  '+#13
                      	+'dbo.Data0015 ON dbo.DATA0137.warehouse_ptr = dbo.Data0015.RKEY  '+#13
         +'WHERE '+#13
         +'(1=1) '+#13+#13+#13;  }

 {   ssql2:=    'SELECT     dbo.DATA0137.curr_date, dbo.DATA0137.production_area AS avlage_area, '+#13+  'dbo.DATA0137.take_out AS total_takeout, '+#13+
      '                      dbo.DATA0137.stan_consume AS avlage_consume, '+#13+
      '                      CASE dbo.DATA0137.take_out WHEN 0 THEN 0 ELSE '+#13+  '(dbo.DATA0137.production_area / dbo.DATA0137.take_out) END AS actual_consume, '+#13+
      '                      CASE dbo.DATA0137.take_out WHEN 0 THEN 0 ELSE '+#13+ '(dbo.DATA0137.production_area / dbo.DATA0137.take_out - dbo.DATA0137.stan_consume) '+#13+
      '                      END AS diff '+#13+
      'FROM         dbo.Data0002 INNER JOIN  '+#13+
      '                      dbo.DATA0136 INNER JOIN '+#13+
      '                      dbo.DATA0155 INNER JOIN '+#13+
      '                      dbo.Data0017 ON dbo.DATA0155.invt_ptr = dbo.Data0017.RKEY ON '+#13+ 'dbo.DATA0136.rkey = dbo.DATA0155.control_ptr INNER JOIN '+#13+
      '                      dbo.DATA0154 INNER JOIN '+#13+
      '                      dbo.Data0034 ON dbo.DATA0154.dept_ptr = dbo.Data0034.RKEY ON '+#13+  'dbo.DATA0136.rkey = dbo.DATA0154.control_ptr ON '+#13+
      '                      dbo.Data0002.RKEY = dbo.DATA0136.unit_ptr INNER JOIN '+#13+
      '                      dbo.Data0015 ON dbo.DATA0136.warehouse_ptr = dbo.Data0015.RKEY LEFT '+#13+ 'OUTER JOIN '+#13+
      '                      dbo.DATA0137 ON dbo.DATA0136.rkey = dbo.DATA0137.control_ptr '+#13+
      'WHERE '+#13+
      '(1=1) '+#13+#13+#13;    }

  //ssql1:=dm.ADO137.SQL.Text;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure TMain_form.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TMain_form.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tquery_form,query_form);
  SpeedButton6Click(sender);
end;


procedure TMain_form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_form.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_form.SpeedButton2Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TMain_form.SpeedButton1Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TMain_form.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TMain_form.SpeedButton3Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TMain_form.SpeedButton4Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
begin
  try
     ChartPreview(Parent,chart1);
  except
      exit;
  end;
end;

end;

procedure TMain_form.Edit1Change(Sender: TObject);
begin

if dm.ADOConnection1.Connected then
   if dm.ADO137.sql.Text <>'' then
    with dm.ADO137 do
     begin
        open;
        Series2.Clear;
        updown2.Max := round(self.Chart1.LeftAxis.Maximum)*2;
        if   dm.ADO137.RecordCount = 0 then exit;
        dm.ADO137.First;
        while not dm.ADO137.Eof do
        begin
          Series2.Add(updown2.Position);
          dm.ADO137.Next;
        end;
    end;
end;

procedure TMain_form.SpeedButton5Click(Sender: TObject);
begin
 PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_form.N2Click(Sender: TObject);
begin
     PageControl1.Pages[1].Show;
     SpeedButton4Click(nil);

end;

procedure TMain_form.N1Click(Sender: TObject);
begin
if  DBGridEh1.DataSource.DataSet.Active then
  begin
  self.ppReport1.Reset;
  self.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'wzpr137rep.rtm';
  self.ppReport1.Template.LoadFromFile;
  self.ppReport1.SaveAsTemplate:=false;
  self.ppReport1.Print;
end else
  ppdbpipeline1.DataSource.DataSet.Active := false;
end;

procedure TMain_form.SpeedButton6Click(Sender: TObject);
var i: integer;
    item:TMenuItem;
    sum,sum2:double;
begin
  if Query_Form.ShowModal=mrok then
  begin
     edit1.text:='0';
     PageControl1.Pages[0].Show;
     edit1.Enabled := False;
     UpDown2.enabled := False;
     dm.ADO137.Close;
     with dm.ADO137 do
     begin
            close;
            dm.ADO137.SQL.Clear;
            dm.ADO137.SQL.Text:=ssql1;
           // sql.Insert(sql.Count-1,' and ( dbo.DATA0137.curr_date >= '+quotedstr(datetostr(Query_Form.dtpk1.Date)+' '
           sql.Insert(sql.Count-1,' and ( dbo.DATA0137.curr_date >= '+quotedstr( formatdatetime('YY-MM-DD',Query_Form.dtpk1.Date)+' '
           // +TimetoStr(Query_Form.DateTimePicker1.Time))+ ' ) ' +#13+
           +(formatdatetime('HH:MM:ss',Query_Form.DateTimePicker1.Time)))+ ' ) ' +#13+
        //    '  and ( dbo.DATA0137.curr_date <='+quotedstr(datetostr(Query_Form.dtpk2.Date)+' '
         '  and ( dbo.DATA0137.curr_date <='+quotedstr(formatdatetime('YY-MM-DD',Query_Form.dtpk2.Date)+' '
         //   +TimetoStr(Query_Form.DateTimePicker2.Time))+' ) ');
         +(formatdatetime('HH:MM:ss',Query_Form.DateTimePicker2.Time)))+' ) ');
            sql.Insert(sql.Count-1,' and ( dbo.Data0015.rkey = '+trim(Query_Form.edit3.Hint)+' ) ');
            sql.Insert(sql.Count-1,' and ( dbo.Data0137.control_ptr  = '+trim(Query_Form.edit4.Hint)+' ) ');
           // sql.Insert(sql.Count-1,' and dbo.Data0034.DEPT_CODE  = '''+trim(Query_Form.edit1.Text)+'''');
           //sql.Insert(sql.Count-1,'and dbo.Data0017.INV_PART_NUMBER  = '''+trim(Query_Form.edit2.Text)+'''');
           // ShowMessage(dm.ADO137.SQL.Text);
            Chart1.Title.text.Clear;
            Chart1.Title.text.text := '单耗: 平方米/' + Query_Form.Label8.Caption;
            DBGridEh1.Columns[2].Title.Caption := '';
            DBGridEh1.Columns[3].Title.Caption := '';
            DBGridEh1.Columns[4].Title.Caption := '';
            DBGridEh1.Columns[5].Title.Caption := '';
            DBGridEh1.Columns[2].Title.Caption := '领用量' + '(' + Query_Form.Label8.Caption +')';
            DBGridEh1.Columns[3].Title.Caption := '实际消耗(千平米)' {+ '(M2/' + Query_Form.Label8.Caption +')'};
             DBGridEh1.Columns[4].Title.Caption := '标准产出' + '(M2/' + Query_Form.Label8.Caption +')';
              DBGridEh1.Columns[5].Title.Caption := '差异' + '(M2/' + Query_Form.Label8.Caption +')';
          dm.ado137.open;
          Series1.Clear;
          Series2.Clear;
          dm.ADO137.First;
          while not dm.ADO137.Eof do
          begin
              Series1.Add(dm.ADO137.FieldValues['actual_consume'],dm.ADO137.FieldValues['curr_date']);
              Series2.Add(dm.ADO137.FieldValues['avlage_consume']);
            //  if  (dm.ADO137.FieldValues['stan_consume']) > (strtoint(trim(edit1.Text))) then edit1.Text := dm.ADO137.FieldValues['stan_consume'];
              dm.ADO137.Next;
          end; //end while

          for i:=1 to DBGridEh1.Columns.Count do
          begin
              item := TmenuItem.Create(self) ;
              item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
              if DBGridEh1.Columns[i-1].Visible then
                item.Checked := true ;
                item.OnClick := item_click ;
                PopupMenu2.Items.Add(item) ;
          end;   //end for
        end;  //end with
         if  (DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[2])='0') or (DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[1])='0') then
            DBGridEh1.Columns[3].Footer.value := '0'
         else
            sum:=StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[2]))/StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[1]));
            DBGridEh1.Columns[3].Footer.value :=FloatToStr(sum*1000);
            //DBGridEh1.Columns[3].Footer.value := FloatToStr(StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[2]))/StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[1])));
          if DBGridEh1.Columns[3].Footer.value<>'0' then begin
                  //Series1.Add(StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[2]))/StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[1])),'平均');
                  sum2:=StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[2]))/StrTofloat(DBGRIDEH1.getfootervalue(0,DBGRIDEH1.columns[1]));
                  Series1.Add((sum2*1000));
                  Series2.Add(dm.ADO137.FieldValues['avlage_consume']);
          end;
      dm.ADO136.Close;
      dm.ADO136.Parameters[0].Value :=  Query_Form.edit4.Hint;
      DM.ADO136.Open;
      DM.ADO154_1.Close;
      DM.ADO154_1.Parameters[0].Value:=Query_Form.edit4.Hint;
      DM.ADO154_1.Open;
      DM.ADO155_1.Close;
      DM.ADO155_1.Parameters[0].Value:=Query_Form.edit4.Hint;
      DM.ADO155_1.Open;
  end;
 DBGridEh1.Columns[0].Title.SortMarker:=smUpEh;
end;

procedure TMain_form.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=1 then
  begin
     edit1.Enabled :=  True;
     updown2.enabled := True;
  end;
  if PageControl1.ActivePageIndex=0 then
  begin
      edit1.enabled := False;
      updown2.enabled := false;
  end;
end;


end.
