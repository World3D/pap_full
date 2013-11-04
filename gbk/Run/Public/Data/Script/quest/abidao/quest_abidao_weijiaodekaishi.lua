--Χ�˵Ŀ�ʼ

--MisDescBegin
x203013_g_ScriptId = 203013
--x203013_g_MissionIdPre =41
x203013_g_MissionId = 81
x203013_g_MissionKind = 13
x203013_g_MissionLevel = 50
--x203013_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x203013_g_Name	="������" 
x203013_g_DemandItem ={}
x203013_g_DemandKill ={{id=335,num=15}}

x203013_g_MissionName="Χ�˵Ŀ�ʼ"
x203013_g_MissionInfo="    �����˶����ţ������󽫾��ܱ�ľ������ħڭħ����������ĵ��죬����һ���ǳ��ƻ����Ϻ��꣬�п��ܻữױ��ƶ��������ͨʿ���������ǡ���Ů�ˣ�����������Щ�˵�ʱ��һ��Ҫ����������ɴ�ɱһǧ�����ɷŹ�һ�������̵��ϵ�ÿһ��������ģ��ʿ�������ǵĳ��ˣ������ǴӰ��̵���Զ��ʧ��Χ���Ѿ���ʼ�����������������ʿ�������ߵĵ���ȥ��ɱ��15��#R���̵�����#W��"  --��������
x203013_g_MissionTarget="    #G������#W����ɱ��15��#R���̵�����#W��"		                                                                                               
x203013_g_MissionComplete="    ������ģ�Ѿ����׵��군�ˣ�"					--�������npc˵���Ļ�
x203013_g_ContinueInfo="    ��ʿ��ɱ�˶���������"
--������
x203013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203013_g_RadioItemBonus={}

--MisDescEnd
x203013_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203013_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203013_g_MissionId)
		if x203013_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203013_g_MissionName)
			AddText(sceneId,x203013_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203013_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����̵�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203013_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203013_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203013_g_MissionName)
		     AddText(sceneId,x203013_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203013_g_ScriptId, x203013_g_MissionId)
                end

        elseif x203013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203013_g_MissionName)
                AddText(sceneId,x203013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203013_g_ScriptId, x203013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203013_g_ScriptId, x203013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203013_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203013_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203013_g_MissionId, x203013_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203013_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203013_g_MissionId)
	for i, item in x203013_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203013_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203013_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203013_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203013_g_MissionId)
		AddExp(sceneId, selfId, x203013_g_ExpBonus)
		AddMoney(sceneId, selfId, x203013_g_MoneyBonus)
		for i, item in x203013_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203013_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203013_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203013_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203013_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203013_g_DemandKill[1].id then 
       		    if num < x203013_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����̵�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203013_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x203013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203013_OnItemChanged(sceneId, selfId, itemdataId)

end

