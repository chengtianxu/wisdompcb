unit formMultiSelectedItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, ADODB,  DBGridEh, Menus, StdCtrls,
  ExtCtrls, Grids, Buttons, Provider, DBClient;

type
  TfrmMultiSelectedItem = class(TForm)
    ds1: TDataSource;
    Dt: TADODataSet;
    pnl1: TPanel;
    pnl2: TPanel;
    Dgh1: TDBGridEh;
    btnOK: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    Dtselected: TBooleanField;
    DtFasset_Code: TStringField;
    DtFASSET_NAME: TStringField;
    DtDEPT_Name: TStringField;
    DtDeviType: TStringField;
    DtMainCycl: TStringField;
    DtABBR_NAME: TStringField;
    Panel1: TPanel;
    bt1: TSpeedButton;
    FieldLabel: TLabel;
    Edit1: TEdit;
    dt1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    dt1selected: TBooleanField;
    dt1ABBR_NAME: TStringField;
    dt1Fasset_Code: TStringField;
    dt1FASSET_NAME: TStringField;
    dt1DEPT_Name: TStringField;
    dt1DeviType: TStringField;
    dt1MainCycl: TStringField;
    DtStdTimeCons: TBCDField;
    dt1StdTimeCons: TBCDField;
    Dtd16rkey: TWordField;
    dt1d16rkey: TSmallintField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DtPlanMainDate: TStringField;
    dt1PlanMainDate: TStringField;
    Dtequipment_grade: TStringField;
    DtLOCATION: TStringField;
    dt1equipment_grade: TStringField;
    dt1LOCATION: TStringField;
    procedure Dgh1KeyPress(Sender: TObject; var Key: Char);
    procedure Dgh1DblClick(Sender: TObject);
    
    procedure DtBeforeInsert(DataSet: TDataSet);
    procedure Dgh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Dgh1ColEnter(Sender: TObject);
    procedure Dgh1Enter(Sender: TObject);
    procedure Dgh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure Dgh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    OpenTableName:string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMultiSelectedItem: TfrmMultiSelectedItem;
 { const StrSQL=
       'declare @TempTable table(selected bit) insert @TempTable values (0)'
       +#13+'select  selected ,CONVERT(VARCHAR(10),getdate(),120) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code ,'
       +#13+'FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCycl,'
       +#13+'[StdTimeCons]=(select [StdTimeCons] from [data0847] where  [D417_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) '
       +#13+'from data0417 d17 '
       +#13+'join data0812 d12 on d17.DeviType=d12.DeviType and active_flag in(3,4)/*3安装完成,4验收合格*/ '
       +#13+'join data0034 d34 on d34.rkey=d17.DEPT_PTR join data0015 d15 on d17.warehouse_ptr=d15.rkey '
       +#13+'join @TempTable on 1=1 where not exists(select * from data0831 d31 '
             +' where d31.DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.MainCycl) ';

  const     StrSQL1='UNION '
       +#13+'select  selected ,CONVERT(VARCHAR(10),d31.PlanMainDate+cycl_duration,120) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code , '
       +#13+'FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCycl, '
       +#13+'[StdTimeCons]=(select [StdTimeCons] from [data0847] where  [D417_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) '
       +#13+'from data0417 d17 '
       +#13+'join data0812 d12 on d17.DeviType=d12.DeviType and active_flag in(3,4)/*3安装完成,4验收合格*/'
       +#13+'join data0034 d34 on d34.rkey=d17.DEPT_PTR    '
       +#13+'join data0015 d15 on d17.warehouse_ptr=d15.rkey '
       +#13+'join @TempTable on 1=1                    '
       +#13+'join data0831 d31 on d31.DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.MainCycl '
       +#13+'join data0816 d16 on d31.MainCycl=d16.MainCycl   '
       +#13+'where not exists(select * from data0831 d31  '
       +#13+'       where d31.DeviNumb=d17.Fasset_Code    '
       +#13+'       and d31.MainCycl=d12.MainCycl and d31.RKEY832 in(1,3,5,6)   )'
       +#13+'order by d17.Fasset_Code  ';      }

 var FilterFieldName:string='Fasset_Code';

implementation

uses     damo, main;


{$R *.dfm}

procedure TfrmMultiSelectedItem.Dgh1KeyPress(Sender: TObject; var Key: Char);
begin {
 if Key=#13 then
 begin
  Dt1.DisableControls;
  dt1.First;
  while not Dt1.Eof do
  begin
     if Dgh1.FieldColumns['选择'].Field.AsBoolean=True then
       begin
          MainForm.DtChild.Append;
          MainForm.DtChild.FieldByName('MainContName').Value:=Dt1.FieldByName('MainContName').Value;
          MainForm.DtChild.FieldByName('MainPart').Value    :=Dt1.FieldByName('MainPart').Value;
          MainForm.DtChild.FieldByName('SpecRequ').Value    :=Dt1.FieldByName('SpecRequ').Value;
          MainForm.DtChild.FieldByName('Remarks').Value     :=Dt1.FieldByName('Remarks').Value;
          MainForm.DtChild.Post;

          Dt1.Edit;
          Dt1.FieldByName('选择').AsBoolean:=False;
          Dt1.Post;
       end;
     Dt1.Next;
  end;
  Dt1.EnableControls;
  Self.Close;
 end ;  }
end;

procedure TfrmMultiSelectedItem.Dgh1DblClick(Sender: TObject);
begin
//if (Dt1.State=dsInsert)or (Dt1.State=dsEdit)then
//Dt1.Post;
 { Dt1.DisableControls;
  dt1.First;
  while not Dt1.Eof do
  begin
     if Dgh1.FieldColumns['选择'].Field.AsBoolean=True then
       begin
          MainForm.DtChild.Append;
          MainForm.DtChild.FieldByName('MainContName').Value:=Dt1.FieldByName('MainContName').Value;
          MainForm.DtChild.FieldByName('MainPart').Value    :=Dt1.FieldByName('MainPart').Value;
          MainForm.DtChild.FieldByName('SpecRequ').Value    :=Dt1.FieldByName('SpecRequ').Value;
          MainForm.DtChild.FieldByName('Remarks').Value     :=Dt1.FieldByName('Remarks').Value;
          MainForm.DtChild.Post;

          Dt1.Edit;
          Dt1.FieldByName('选择').AsBoolean:=False;
          Dt1.Post;
       end;
     Dt1.Next;
  end;
  Dt1.EnableControls;

Close;    }
end;



procedure TfrmMultiSelectedItem.DtBeforeInsert(DataSet: TDataSet);
begin
Abort;
end;

procedure TfrmMultiSelectedItem.Dgh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TfrmMultiSelectedItem.FormShow(Sender: TObject);
var
  str_temp:string;
begin
  Dt1.Close;

  //str_temp:=StrSQL;
  with  frm_main.Cbb_WareHouse  do
  begin
//    frmPlanMain.cds0015.First;
//    if frmPlanMain.cds0015.RecordCount<> ItemIndex    then//即不是最后(全部)一个，
//    begin
//      str_temp:=ADOQuery1.SQL.Text;
//      frmPlanMain.cds0015.MoveBy(ItemIndex);
//      str_temp:=str_temp+' and Fasset_Code in (select FASSET_CODE from data0417 where warehouse_ptr='+frmPlanMain.cds0015RKEY.AsString+')' ;
//      str_temp:=str_temp+#13
//        +ADOQuery2.SQL.Text+' where Fasset_Code in (select FASSET_CODE from data0417 where warehouse_ptr='+frmPlanMain.cds0015RKEY.AsString+')'
//    end
//    else
//    begin
//      str_temp:=ADOQuery1.SQL.Text+#13+ADOQuery2.SQL.Text;
//    end;
    if Text <> '全部'    then//即不是最后(全部)一个，
    begin
      
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'SELECT DATA0417.warehouse_ptr, Data0015.RKEY, Data0015.ABBR_NAME'+
          ' FROM Data0015 INNER JOIN DATA0417 ON Data0015.RKEY = DATA0417.warehouse_ptr'+
          ' where Data0015.ABBR_NAME ='+QuotedStr(frm_main.Cbb_WareHouse.Text);
        Open;
      end;
      str_temp:=ADOQuery1.SQL.Text;
      str_temp:=str_temp+' and Fasset_Code in (select FASSET_CODE from data0417 where warehouse_ptr='+QuotedStr(dm.tmp.FieldByName('RKEY').Value)+')' ;
      str_temp:=str_temp+#13
        +ADOQuery2.SQL.Text+' where Fasset_Code in (select FASSET_CODE from data0417 where warehouse_ptr='+QuotedStr(dm.tmp.FieldByName('RKEY').Value)+')'
    end
    else
    begin
     
      str_temp:=ADOQuery1.SQL.Text+#13+ADOQuery2.SQL.Text;
    end;


  end;
  Dt1.CommandText:=  str_temp +#13+ 'order by FASSET_NAME,PlanMainDate,d16rkey';
  //ShowMessage(Dt1.CommandText);
  Dt1.Open;
  CheckBox1.Checked:=False;

  Dgh1.SetFocus;
  Dgh1.SelectedIndex:=3;
end;

procedure TfrmMultiSelectedItem.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMultiSelectedItem.CheckBox1Click(Sender: TObject);
var
  BM:Pointer;//TBookmark;
begin
  with Dgh1.DataSource.DataSet do
  begin
      bm:=GetBookmark;//书签。
      try
        DisableControls;
        Screen.Cursor := crHourGlass;
        First;
        while not Eof do
        begin
          Edit;
          if (Sender as  TCheckBox).Checked then
            FieldByName('selected').Value:=True
          else
            FieldByName('selected').Value:=False;
          Next;
        end;
        GotoBookmark(BM);  // 重新定位到书签
      finally
        FreeBookmark(bm ); //释放书签。
        EnableControls ;
        Screen.Cursor := crDefault;
      end;   
  end;

end;

procedure TfrmMultiSelectedItem.Dgh1ColEnter(Sender: TObject);
begin
   FieldLabel.Caption:=(Sender as TDBGridEh).SelectedField.DisplayLabel;
   FieldLabel.Left:=5;
   Edit1.Left:=10+ FieldLabel.Width;
   bt1.Left:= Edit1.Left+ Edit1.Width+5;
   FilterFieldName:= (Sender as TDBGridEh).SelectedField.FieldName;
end;

procedure TfrmMultiSelectedItem.Dgh1Enter(Sender: TObject);
begin
   FieldLabel.Caption:=(Sender as TDBGridEh).SelectedField.DisplayLabel;
   FieldLabel.Left:=5;
   Edit1.Left:=10+ FieldLabel.Width;
   bt1.Left:= Edit1.Left+ Edit1.Width+5;
   FilterFieldName:= (Sender as TDBGridEh).SelectedField.FieldName;
end;

procedure TfrmMultiSelectedItem.Dgh1TitleClick(Column: TColumnEh);
begin
   FieldLabel.Caption:=Column.Field.DisplayLabel;
   FieldLabel.Left:=5;
   Edit1.Left:=10+ FieldLabel.Width;
   bt1.Left:= Edit1.Left+ Edit1.Width+5;
   FilterFieldName:= Column.Field.FieldName;
end;

procedure TfrmMultiSelectedItem.Edit1Change(Sender: TObject);
//var
//  strsql: string;
begin
 // if AddListForm.Visible=True then
  begin
//    strsql := '';
//    if trim(Edit1.Text) <> '' then
//    begin
//      strsql :=  FilterFieldName+' like ''%' + trim(Edit1.Text) + '%''';
//    end   ;

    if Trim(Edit1.Text) <> '' then
    begin
      Dgh1.DataSource.DataSet.Filter := FilterFieldName+' like ''%' + trim(Edit1.Text) + '%''';
      Dgh1.DataSource.DataSet.Filtered := true;
    end
    else
    begin
      Dgh1.DataSource.DataSet.Filter := '';
      Dgh1.DataSource.DataSet.Filtered := false;
    end;
  end;
end;

procedure TfrmMultiSelectedItem.bt1Click(Sender: TObject);
begin
  Edit1.Clear;
  if Dgh1.DataSource.DataSet.Filtered then
  Dgh1.DataSource.DataSet.Filtered:=False;
end;

procedure TfrmMultiSelectedItem.Dgh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText);
  end;
end; {
declare @TempTable table(selected bit) insert @TempTable values (0)
select d31.rkey, selected ,CONVERT(VARCHAR(10),d31.PlanMainDate+cycl_duration,120) PlanMainDate,d15.ABBR_NAME,d17.Fasset_Code , 
FASSET_NAME ,DEPT_Name ,d17.DeviType ,d12.MainCycl, 
[StdTimeCons]=(select [StdTimeCons] from [data0847] where  [D417_ptr]=d17.rkey and d12.MainCycl  =[data0847].MainCycl) 
from data0417 d17 
join data0812 d12 on d17.DeviType=d12.DeviType and active_flag in(3,4)/*3安装完成,4验收合格*/
join data0034 d34 on d34.rkey=d17.DEPT_PTR    
join data0015 d15 on d17.warehouse_ptr=d15.rkey 
join @TempTable on 1=1                    
join data0831 d31 on d31.DeviNumb=d17.Fasset_Code and d31.MainCycl=d12.MainCycl 
join data0816 d16 on d31.MainCycl=d16.MainCycl   
where exists (
    select * from 
        (select max(PlanMainDate)PlanMainDate,DeviNumb,MainCycl from data0831 
        where RKEY832 in (2,4)
        and not exists(select * from data0831 d31 where data0831.DeviNumb=d31.DeviNumb    
               and data0831.MainCycl=d31.MainCycl and d31.RKEY832 in(1,3,5,6) )         
        group by DeviNumb,MainCycl  )as t1  
    where d31.PlanMainDate=t1.PlanMainDate
    and d31.DeviNumb=t1.DeviNumb and d31.MainCycl=t1.MainCycl 
)
order by d31.DeviNumb,d31.MainCycl  }
end.
