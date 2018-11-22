unit BaseUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Grids, DBGrids,DBGridEh,DB,ADODB,Excel2000, OleServer, ExcelXP
  ,StdCtrls, Mask ,DBCtrls ;



type
  TBaseForm1 = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    vColumn1: TColumnEh;
    vColumn2: TColumnEh;
    vColumn3: TColumnEh;
    //vs3:string;

  public
    { Public declarations }
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH; Rect: TRect; DataCol: Integer;
                                   Column: TColumnEh; State: TGridDrawState);
    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOStoredProc;const value2:integer); overload;
    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADODataSet;const value2:integer); overload;

    procedure DbgridEHToExcel2(DBGridEh_value: TDBGridEh; stitle: string);


    //V2为0时只允许输入0..9的数字,1只允许输入0..9的数字与一个小数点
    //Sender只能为Tedit,TMaskEdit类
    procedure CheckMaskEditKeyPress(Sender: TObject; var Key: Char;CONST V2:INTEGER);



  end;

var
  BaseForm1: TBaseForm1;

implementation

uses
   Unit1;
{$R *.dfm}

{ TBaseForm1 }

procedure TBaseForm1.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
         begin
              DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
              DBGridEHName.Canvas.FillRect(rect);
              DBGridEHName.Canvas.font.color:=clblack;
         end
   else
         begin
              DBGridEHName.Canvas.Brush.Color:=clwhite;
              DBGridEHName.Canvas.FillRect(rect);
              DBGridEHName.Canvas.font.color:=clblack;
         end;

    if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
         begin
              DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
              DBGridEHName.Canvas.FillRect(rect);
              DBGridEHName.Canvas.font.color:=clblack;
         end;
     DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);
end;





procedure TBaseForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOStoredProc; const value2: integer);
var
  sortstring:string; //排序列
begin
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
    begin
       if value2=1 then
           begin
               if Column<> vColumn1  then
                   begin
                       if vColumn1<>nil then
                           vColumn1.Title.color:=clbtnface;
                       vColumn1:=Column;
                       Column.Title.Color :=clred;
                   end;
           end
       else if value2=2 then
           begin
               if Column<> vColumn2  then
                   begin
                       if vColumn2<>nil then
                           vColumn2.Title.color:=clbtnface;
                       vColumn2:=Column;
                       Column.Title.Color :=clred;
                   end;
           end
       else if value2=3 then
           begin
               if Column<> vColumn3  then
                   begin
                       if vColumn3<>nil then
                         vColumn3.Title.color:=clbtnface;
                       vColumn3:=Column;
                       Column.Title.Color :=clred;
                   end;
           end;


       if FieldName = '' then
          Exit;
       case Title.SortMarker of
          smNoneEh:
              begin
                  Title.SortMarker := smDownEh;
                  sortstring := Column.FieldName + ' ASC';
              end;
          smDownEh: sortstring := Column.FieldName + ' ASC';
          smUpEh: sortstring := Column.FieldName + ' DESC';
          end;
       //进行排序
       try
           value.Sort := sortstring //dataset为实际数据集变量名
       except
       end;
    end;
end;

procedure TBaseForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADODataSet; const value2: integer);
var
  sortstring:string; //排序列
begin
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
     if value2=1 then
         begin
             if Column<> vColumn1  then
                 begin
                     if vColumn1<>nil then
                         vColumn1.Title.color:=clbtnface;
                     vColumn1:=Column;
                     Column.Title.Color :=clred;
                 end;
         end
     else if value2=2 then
         begin
             if Column<> vColumn2  then
                 begin
                     if vColumn2<>nil then
                         vColumn2.Title.color:=clbtnface;
                     vColumn2:=Column;
                     Column.Title.Color :=clred;
                 end;
         end
     else if value2=3 then
         begin
             if Column<> vColumn3  then
                 begin
                     if vColumn3<>nil then
                         vColumn3.Title.color:=clbtnface;
                     vColumn3:=Column;
                     Column.Title.Color :=clred;
                 end;
         end;


    if FieldName = '' then
        Exit;
    case Title.SortMarker of
        smNoneEh:
                begin
                    Title.SortMarker := smDownEh;
                    sortstring := Column.FieldName + ' ASC';
                end;
        smDownEh: sortstring := Column.FieldName + ' ASC';
        smUpEh: sortstring := Column.FieldName + ' DESC';
        end;
    //进行排序
    try
        value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
end;




{
procedure TMainForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if not (gdFixed in State) then
     DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;
}

{
procedure TMainForm1.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if not DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if dm.wzcx56_1.RecordCount <= 1 then exit;
       TitleBtnSort1(sender,acol,column,dm.wzcx56_1,1);

end;
}
procedure TBaseForm1.DbgridEHToExcel2(DBGridEh_value: TDBGridEh;
  stitle: string);
var
  eaApps1: TExcelApplication;
     y   : integer;
  //tsList : TStringList;
  s,t : string;
  aSheet : Variant;
  v_cloumn,jCount:integer;
  vstr:string;
  sum2,n1,n2:integer;
begin
  if not DBGridEh_value.DataSource.DataSet.Active then
     begin
       showmessage('请先打开数据内容！！！按查谒条件...来打开数据');
       exit;
     end;
  //if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  Screen.Cursor := crHourGlass;
  eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  //Application.CreateForm(TForm_Progress, Form_Progress);

  Form1:=TForm1.Create(application) ;
  Form1.Show;
  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  //eaapps1.worksheets.Add(null,null,2,null,0);
  //Form_Progress.show;

  DBGridEh_value.DataSource.DataSet.DisableControls;
  //dm.wzcx48_1.DisableControls;


  //Form_Progress.Label1.Caption :='正在材料实际数据...';
  //Form_Progress.stepvalue := 0;
  //Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[1];

  sum2:=DBGridEh_value.DataSource.DataSet.RecordCount ;
  Form1.ProgressBar1.Min :=0;
  Form1.ProgressBar1.Max := 100;
  Form1.ProgressBar1.Position :=0;


  s:='序号'+#9;
  //tsList:=TStringList.Create;
  try
    aSheet.cells[1, 1] := '序号';
    v_cloumn := 2;
    for y := 0 to DBGridEh_value.Columns.Count - 1 do
     begin
       aSheet.cells[1, y + v_cloumn] := DBGridEh_value.Columns.Items[y].Title.Caption ;
       //s:=s+DBGridEh_value.Columns.Items[y].Title.Caption+#9;
     end;

    //tsList.Add(s);
    DBGridEh_value.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh_value.DataSource.DataSet.Eof do
      begin
        //v_cloumn:=2;
        //s:=inttostr(DBGridEh_value.DataSource.DataSet.RecNo)+#9;
        n1 := trunc(100*(DBGridEh_value.DataSource.DataSet.RecNo)/sum2);
        if n1 <> n2 then
            begin
                Form1.ProgressBar1.Position := n1;
                Form1.Label1.Caption := '  '+ inttostr(n1)+' %  ';
                n2:=n1;
            end;
        aSheet.cells[jCount, 1]:=inttostr(DBGridEh_value.DataSource.DataSet.RecNo);
        for y:=0 to DBGridEh_value.Columns.Count-1 do
            begin
                //s1:=DBGridEh_value.Columns.Items[y].Field.text;
                //s:=s+s1+#9;
                aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh_value.Columns.Items[y].Field.text;
            end;
        //tsList.Add(s);
        jCount := jCount +1;
        DBGridEh_value.DataSource.DataSet.Next;
      end;
    //clipboard.Clear;
    //Clipboard.AsText:=tsList.Text;
  finally
    //tsList.Free;
    eaapps1.Disconnect;
    //aSheet.Paste;
    //clipboard.Clear;
  end;

  if DBGridEh_value.Columns.Count+1<=26 then
      begin
           vstr := chr(DBGridEh_value.Columns.Count+1+96) ;
           //showmessage(  vstr +'  '  +inttostr(DBGridEh1.Columns.Count) );
      end
  else
      begin
          vstr := chr(strtoint(floattostr(int((DBGridEh_value.Columns.Count+1)/26)+96)))
                  +chr(strtoint(floattostr(DBGridEh_value.Columns.Count+1-26*int((DBGridEh_value.Columns.Count+1)/26)+96)));
      end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:=stitle;
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh_value.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth := 20;
  asheet.Name :=stitle;
  {}
  DBGridEh_value.DataSource.DataSet.EnableControls;


  eaapps1.Visible[0]:=true;         // display Excel files
  //Form_Progress.free;
  Form1.Free;
  //dm.find1 :=true;
   Screen.Cursor := crDefault;
end;

procedure TBaseForm1.CheckMaskEditKeyPress(Sender: TObject; var Key: Char;
  const V2: INTEGER);
var
  s : string ;  //V2为0时只允许输入0..9的数字,1只允许输入0..9的数字与一个小数点
begin
  IF V2 = 0 THEN
      BEGIN
          if not (key in ['0'..'9',#8]) then
              begin
                  showmessage('只允许输入数字');
                  abort ;
              end
      END
  ELSE IF V2 = 1 THEN
      BEGIN
          if not (key in ['0'..'9','.',#8]) then
              begin
                  showmessage('只允许输入数字与一个小数点');
                  abort ;
              end
          else
              begin
                  if (key = chr(46)) then
                  if Sender is Tedit then
                      s := (Sender as tedit).Text
                  else if Sender is TMaskEdit then
                      s := (Sender as TMaskEdit).Text
                  else if Sender is Tcombobox then
                      s := (Sender as Tcombobox).Text
                  else
                      exit ;
                  if pos('.',s)>0 then
                      begin
                           showmessage('只允许输入一个小数点');
                           abort;
                      end ;
              end;
      END ;
end; {}


procedure TBaseForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
      if  not (Activecontrol is TdbgridEh) then
          if  not (Activecontrol is Tdbmemo) then
              if  not (Activecontrol is TStringGrid) then
                  begin { 不是在TDbgrid控件内}
                      perform(wm_nextdlgctl,0,0);{移动到下一个控件}
                      key:=#0;
                  end;
end;

end.
