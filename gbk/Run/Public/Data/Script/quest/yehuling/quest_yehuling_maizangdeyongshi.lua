--�������ʿ

--MisDescBegin
--��ǰ�ű���������
x207001_g_ScriptId = 207001

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x207001_g_MissionId = 2

--�������
x207001_g_MissionKind = 1

--������ʼnpc
x207001_g_Name	= "�ٲ�̨"
x207001_g_Name1	= "ʯͷ��"
x207001_g_Name2	= "���˵��ɹű�"

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x207001_g_MissionMinLevel = 1
x207001_g_MissionMaxLevel = 200

--ǰ�������MissionID,������д���ǰ������
x207001_g_MisIdPre = 1

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x207001_g_ScriptIdNext = {ScriptId = 207002 ,LV = 0 }

--****************************************�������ݿ�ʼ*********************************************************************
--��������
x207001_g_MissionName="�������ʿ"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x207001_g_MissionInfo="    �����ܲ����㣬�ѵ���û�п��������ǽ�����ǵ��ڻ�������ˣ�ѹ�����Ǻܶ����ʿ����Ҫ�����Ǿȳ���������������һ������ʲô���벻�����ˣ����#G�����#W����ȥ�ɡ�����\n \n    �����������м�������������ô�����飬������ܰ��Ұ��ҵ���ʿ���ȳ������ҿ��ܻ�����һ��ʲô��"
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x207001_g_ContinueInfo="    ��ʿ�ǻ��������������棬�ٸ�����������£�������ֱ��ȥ������ү��"
--�ܵĴ�������Ŀ��������һ�仰����
x207001_g_MissionTarget="    ����11��#G���˵��ɹű�#W"	
x207001_g_MissionComplete="    ��ɱ�˵���������������ʱ�����ϣ��������������µ��˾�Ӧ��������!"		

	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x207001_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x207001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207001_g_RadioItemBonus={}
--MisDescEnd
--**********************************������ں���**********************************

function x207001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	misIndex = GetMissionIndexByID(sceneId,selfId,x207001_g_MissionId)
	local NPCX,NPCY = LuaFnGetWorldPos(sceneId,targetId)
	if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207001_g_Name) then
			if (GetMissionParam(sceneId,selfId,misIndex,0)) < 11 then
				BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207001_g_MissionName)
				AddText(sceneId,x207001_g_ContinueInfo)
		        	AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207001_g_MissionTarget)
				AddText(sceneId,format("\n    �ȳ����˵��ɹű�   %d/11", GetMissionParam(sceneId,selfId,misIndex,0) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			else
				BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207001_g_MissionName)
				AddText(sceneId,x207001_g_MissionComplete)
		        	AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207001_g_MissionTarget) 
				AddText(sceneId,format("\n    �ȳ����˵��ɹű�   %d/11", GetMissionParam(sceneId,selfId,misIndex,0) ))
				AddMoneyBonus(sceneId, x207001_g_MoneyBonus)	
				EndEvent()
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)
			end
			
		elseif (GetName(sceneId,targetId)==x207001_g_Name1) then

			BeginEvent(sceneId)
			AddText(sceneId,"�ǿ�������")
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			if random(1,100)>50 then
				LuaFnCreateMonster(sceneId, 124,NPCX+random(-3,3),NPCY+random(-3,3),0,1,-1)
				
			else 
				local a = LuaFnCreateMonster(sceneId,268,NPCX+random(-3,3),NPCY+random(-3,3),3,1,-1)
				
			end
			--LuaFnGmKillObj(sceneId,selfId,targetId)
			
			
		elseif (GetName(sceneId,targetId)==x207001_g_Name2) then
			num = GetMissionParam(sceneId,selfId,misIndex,0)                                        
             		if num <=11  then    
             			SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)  
				BeginEvent(sceneId)
				AddText(sceneId,format("�ȳ����˵��ɹű�   %d/11", GetMissionParam(sceneId,selfId,misIndex,0) ))
				EndEvent()
			end
			DispatchMissionTips(sceneId, selfId)
			LuaFnDeleteMonster (sceneId,targetId )
		end
	elseif x207001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207001_g_MissionName)
                AddText(sceneId,x207001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207001_g_MissionTarget )
		AddMoneyBonus(sceneId, x207001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)
        end	
end


--**********************************

--�о��¼�

--**********************************

function x207001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207001_CheckPushList(sceneId, selfId, targetId) > 0 then
		if (GetName(sceneId,targetId) ~=x207001_g_Name2) then
			AddNumText(sceneId, x207001_g_ScriptId, x207001_g_MissionName)
		else
			AddNumText(sceneId, x207001_g_ScriptId, "�˵�����")
		end
	end
	
end



--**********************************

--����������

--**********************************

function x207001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207001_g_Name) then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207001_CheckPushList(sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207001_g_MissionId)
        if IsMissionHaveDone(sceneId, selfId, x207001_g_MisIdPre) > 0 then
        	if (GetName(sceneId,targetId)==x207001_g_Name) then
                    return 1
                end
                if (GetName(sceneId,targetId)==x207001_g_Name1) then
                	if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
                		if (GetMissionParam(sceneId,selfId,misIndex,0)) < 11 then
                    			return 1
                    		end
                    	end
                end
                if (GetName(sceneId,targetId)==x207001_g_Name2) then
                	if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
                		if (GetMissionParam(sceneId,selfId,misIndex,0)) < 11 then
                    			return 1
                    		end
                    	end
                end
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207001_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207001_g_MissionId, x207001_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������:"..x207001_g_MissionName)
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207001_g_MissionId)

end




--**********************************

--����Ƿ�����ύ

--**********************************

function x207001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207001_g_MissionId)
	if (GetMissionParam(sceneId,selfId,misIndex,0)) == 11 then
		return 1
	end

end



--**********************************

--�ύ

--**********************************

function x207001_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 	MissionCom( sceneId,selfId, x207001_g_MissionId )
    	DelMission( sceneId, selfId, x207001_g_MissionId )
	AddExp(sceneId, selfId, x207001_g_ExpBonus)   
	AddMoney(sceneId, selfId, x207001_g_MoneyBonus)
	CallScriptFunction( x207001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
   		
	     
end


--**********************************

--ɱ����������

--**********************************

function x207001_OnKillObject(sceneId, selfId, objdataId,objid) 
	if objdataId == 286 then
		LuaFnDeleteMonster (sceneId,objid )
	end
        	
end                                                                                                   
                  




--**********************************

--���������¼�

--**********************************

function x207001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207001_OnItemChanged(sceneId, selfId, itemdataId)

end


