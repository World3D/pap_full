--��һگ��

--MisDescBegin
x208000_g_ScriptId = 208000
--x208000_g_MissionIdPre =41
x208000_g_MissionId = 54
x208000_g_MissionKind = 12
x208000_g_MissionLevel = 60
--x208000_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x208000_g_Name	="�ɼ�˼��" 
x208000_g_DemandItem ={}
x208000_g_DemandKill ={{id=309,num=20}}

x208000_g_MissionName="��һگ��"
x208000_g_MissionInfo="    а���ħ�������ħڭħ�����壬����̰�����Դ��ռ���ˣ�������մ����Ѫ��ذ���ں�ɳĮ�ﷸ�����������������������ǵ��䱦����ƥ��ɱ��������450��ͬ�������������ҳ��������ʿ����ʹ�����ǵ�����Ҳ�����ˡ���ǡ�������ģ���ˣ�һ��ҪΪ����а����о��������ۡ�\n \n    ��--�ɼ�˼���������е���ʿ�Ƿ�����һگ���������һ�����ˣ����������������ֻҪ���ܴ���������壬����Щ������ģ�˵�Ѫ���ڴ���ϣ��㽫��õ�������Ľ��͡�"  --��������
x208000_g_MissionTarget="    ɱ��20��#R������ģ��ʿ#W��������#G�ɼ�˼��#W���͡�"		                                                                                               
x208000_g_MissionComplete="    �ԣ�һ��Ҫ�����ǵ�Ѫ��������Щ��ȥ���ˣ�"					--�������npc˵���Ļ�
x208000_g_ContinueInfo="    �벻Ҫ������Щ������ģ�ˣ�ֻ��ɱ�����ǲ���ƽϢ���ǳ�޵�ŭ��"
--������
x208000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208000_g_RadioItemBonus={}

--MisDescEnd
x208000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x208000_g_MissionId)
		if x208000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208000_g_MissionName)
			AddText(sceneId,x208000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ģ��ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x208000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208000_g_MissionName)
		     AddText(sceneId,x208000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208000_g_ScriptId, x208000_g_MissionId)
                end

        elseif x208000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208000_g_MissionName)
                AddText(sceneId,x208000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208000_g_ScriptId, x208000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208000_g_ScriptId, x208000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x208000_g_MissionId, x208000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x208000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x208000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208000_g_MissionId)
	for i, item in pairs(x208000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x208000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208000_g_MissionId)
		AddExp(sceneId, selfId, x208000_g_ExpBonus)
		AddMoney(sceneId, selfId, x208000_g_MoneyBonus)
		for i, item in pairs(x208000_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x208000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x208000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x208000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x208000_g_DemandKill[1].id then 
       		    if num < x208000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģ��ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x208000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208000_OnItemChanged(sceneId, selfId, itemdataId)

end

